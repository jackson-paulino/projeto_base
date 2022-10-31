import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_base/src/data/datasources/featch_events_datasource.dart';
import 'package:projeto_base/src/data/datasources/featch_pdv_dates_datasource.dart';
import 'package:projeto_base/src/data/datasources/featch_pdvs_datasource.dart';
import 'package:projeto_base/src/data/datasources/featch_sales_dates_datasource.dart';
import 'package:projeto_base/src/data/datasources/featch_sales_pdv_datasource.dart';
import 'package:projeto_base/src/data/datasources/featch_ticket_lotes_datasource.dart';
import 'package:projeto_base/src/data/datasources/featch_ticket_sales_datasource.dart';
import 'package:projeto_base/src/data/datasources/featch_withdraw_pdv_datasource.dart';
import 'package:projeto_base/src/data/repositories/event_repository.dart';
import 'package:projeto_base/src/domain/entities/balance_tickets.dart';
import 'package:projeto_base/src/domain/entities/event.dart';
import 'package:projeto_base/src/domain/entities/pdv.dart';
import 'package:projeto_base/src/domain/entities/sales_dates.dart';
import 'package:projeto_base/src/domain/entities/sales_pdv.dart';
import 'package:projeto_base/src/domain/entities/ticket_lotes.dart';
import 'package:projeto_base/src/domain/entities/withdraw_pdv.dart';
import 'package:projeto_base/src/domain/errors/errors.dart';
import 'package:projeto_base/src/domain/repositories/event_repository.dart';
import 'package:mocktail/mocktail.dart';

class FeatchEventsDatasourcesMock extends Mock implements IFeatchEventDatasource {}

class FeatchTicketSalesDatasourceMock extends Mock implements IFeatchTicketSalesDatasource {}

class FeatchSalesPdvDatasourceMock extends Mock implements IFeatchSalesPdvDatasource {}

class FeatchSalesDatesDatasourceMock extends Mock implements IFeatchSalesDatesDatasource {}

class FeatchWithdrawPdvDatasourceMock extends Mock implements IFeatchWithdrawPdvDatasource {}

class FeatchPdvsDatasourceMock extends Mock implements IFeatchPdvsDatasource {}

class FeatchTicketLotesDatasourceMock extends Mock implements IFeatchTicketLotesDatasource {}

class FeatchPdvDatesDatasourceMock extends Mock implements IFeatchPdvDatesDatasource {}

void main() {
  final IFeatchEventDatasource featchEvent = FeatchEventsDatasourcesMock();
  final IFeatchTicketSalesDatasource featchTicketSales = FeatchTicketSalesDatasourceMock();
  final IFeatchSalesPdvDatasource featchSalesPdv = FeatchSalesPdvDatasourceMock();
  final IFeatchSalesDatesDatasource featchSalesDates = FeatchSalesDatesDatasourceMock();
  final IFeatchWithdrawPdvDatasource featchWithdrawPdv = FeatchWithdrawPdvDatasourceMock();
  final IFeatchPdvsDatasource featchPdvs = FeatchPdvsDatasourceMock();
  final IFeatchTicketLotesDatasource featchTicketLotes = FeatchTicketLotesDatasourceMock();
  final IFeatchPdvDatesDatasource featchPdvDates = FeatchPdvDatesDatasourceMock();
  final IEventRepository repository = EventRepository(
      featchEvent,
      featchTicketSales,
      featchSalesPdv,
      featchSalesDates,
      featchWithdrawPdv,
      featchPdvs,
      featchTicketLotes,
      featchPdvDates);
  const String eventId = '14';

  test('deve retornar um list de eventos', () async {
    when(() => featchEvent.featchEvents()).thenAnswer((_) async => _eventJson);

    final response = await repository.featchEvents();

    expect(response.fold((l) => l, (r) => r), isA<List<Event>>());

    final result = (response.fold((l) => l, (r) => r) as List<Event>);

    expect(result.elementAt(0).eventName, 'Vibe 360');
  });

  test('deve retornar um FalireException caso der error na consulta', () async {
    const error = FalireException('Error');
    when(() => featchEvent.featchEvents()).thenThrow(error);

    final response = await repository.featchEvents();

    expect(response.fold((l) => l, (r) => r), isA<FalireException>());
  });

  test('deve retornar o balanco das vendas por ingressos', () async {
    when(() => featchTicketSales.featchTicketSales(eventId)).thenAnswer((_) async => _jsonBalance);

    final response = await repository.featchTicketSales(eventId);

    expect(response.fold((l) => l, (r) => r), isA<BalanceTickets>());

    final result = (response.fold((l) => l, (r) => r) as BalanceTickets);

    expect(result.grandTotalTicketSold, 6170);
  });

  test('deve retornar um FalireException caso der error na consulta', () async {
    const error = FalireException('Error');
    when(() => featchTicketSales.featchTicketSales(eventId)).thenThrow(error);

    final response = await repository.featchTicketSales(eventId);

    expect(response.fold((l) => l, (r) => r), isA<FalireException>());
  });

  test('deve retornar as vendas por pdv', () async {
    when(() => featchSalesPdv.featchSalesPdv(eventId)).thenAnswer((_) async => _jsonSalesPdv);

    final response = await repository.featchSalesPdv(eventId);

    expect(response.fold((l) => l, (r) => r), isA<SalesPdv>());

    final result = (response.fold((l) => l, (r) => r) as SalesPdv);

    expect(result.creditCardGeneral, 1390);
  });

  test('deve retornar um FalireException caso der error na consulta', () async {
    const error = FalireException('Error');
    when(() => featchSalesPdv.featchSalesPdv(eventId)).thenThrow(error);

    final response = await repository.featchSalesPdv(eventId);

    expect(response.fold((l) => l, (r) => r), isA<FalireException>());
  });

  test('deve retornar as vendas por data', () async {
    when(() => featchSalesDates.featchSalesDates(eventId)).thenAnswer((_) async => _salesDates);

    final response = await repository.featchSalesDates(eventId);

    expect(response.fold((l) => l, (r) => r), isA<SalesDates>());

    final result = (response.fold((l) => l, (r) => r) as SalesDates);

    expect(result.totalGeneral, 6170);
  });

  test('deve retornar um FalireException caso der error na consulta', () async {
    const error = FalireException('Error');
    when(() => featchSalesDates.featchSalesDates(eventId)).thenThrow(error);

    final response = await repository.featchSalesDates(eventId);

    expect(response.fold((l) => l, (r) => r), isA<FalireException>());
  });

  test('deve retornar as retirada por pdvs', () async {
    when(() => featchWithdrawPdv.featchWithdrawPdv(eventId)).thenAnswer((_) async => _withdrawPdvs);

    final response = await repository.featchWithdrawPdv(eventId);

    expect(response.fold((l) => l, (r) => r), isA<WithdrawPdv>());

    final result = (response.fold((l) => l, (r) => r) as WithdrawPdv);

    expect(result.totalBalance, 6170);
  });

  test('deve retornar um FalireException caso der error na consulta', () async {
    const error = FalireException('Error');
    when(() => featchWithdrawPdv.featchWithdrawPdv(eventId)).thenThrow(error);

    final response = await repository.featchWithdrawPdv(eventId);

    expect(response.fold((l) => l, (r) => r), isA<FalireException>());
  });

  test('deve retornar as retirada por pdvs', () async {
    when(() => featchPdvs.featchPdvs(eventId)).thenAnswer((_) async => _pdvs);

    final response = await repository.featchPdvs(eventId);

    expect(response.fold((l) => l, (r) => r), isA<List<Pdv>>());

    final result = (response.fold((l) => l, (r) => r) as List<Pdv>);

    expect(result[0].placeOfEstablishment, 'Lê Figaro Barbearia');
  });

  test('deve retornar um FalireException caso der error na consulta', () async {
    const error = FalireException('Error');
    when(() => featchPdvs.featchPdvs(eventId)).thenThrow(error);

    final response = await repository.featchPdvs(eventId);

    expect(response.fold((l) => l, (r) => r), isA<FalireException>());
  });

  test('deve retornar as retirada por pdvs', () async {
    when(() => featchTicketLotes.featchTicketLotes(eventId)).thenAnswer((_) async => _lotesSale);

    final response = await repository.featchTicketLotes(eventId);

    expect(response.fold((l) => l, (r) => r), isA<List<TicketLotes>>());

    final result = (response.fold((l) => l, (r) => r) as List<TicketLotes>);

    expect(result[0].name, 'INGRESSO');
  });

  test('deve retornar um FalireException caso der error na consulta', () async {
    const error = FalireException('Error');
    when(() => featchTicketLotes.featchTicketLotes(eventId)).thenThrow(error);

    final response = await repository.featchTicketLotes(eventId);

    expect(response.fold((l) => l, (r) => r), isA<FalireException>());
  });
}

List<Map<String, dynamic>> _eventJson = [
  {
    "event_id": 14,
    "event_name": "Vibe 360",
    "event_date": "2022-06-15 22:00:26",
    "event_local": "Galpão Porto das Barcas",
    "quantity_sold_today": 0,
    "total_sold_today": 0,
    "quantity_sold_all": 156,
    "total_sold_all": 6170
  },
  {
    "event_id": 15,
    "event_name": "Quarta do Humor",
    "event_date": "2022-06-22 20:30:06",
    "event_local": "Dr. Camarão Porto das Barcas",
    "quantity_sold_today": 0,
    "total_sold_today": 0,
    "quantity_sold_all": 62,
    "total_sold_all": 1330
  },
  {
    "event_id": 17,
    "event_name": "Murilo Huff",
    "event_date": "2022-10-11 21:00:15",
    "event_local": "Theresina Hall",
    "quantity_sold_today": 0,
    "total_sold_today": 0,
    "quantity_sold_all": 38,
    "total_sold_all": 2500
  }
];

Map<String, dynamic> _jsonBalance = {
  "grand_total_ticket_quantity_sold": 156,
  "grand_total_ticket_sold": 6170,
  "grand_total_ticket_courtesy_quantity": 50,
  "tickets": [
    {
      "name": "Ingresso Vibe 360",
      "type": "INTEIRA",
      "lotes": [
        {"price": 40, "name": "1° Lote", "quantity": 149, "total": 5960},
        {"price": 30, "name": "Lote Promocional", "quantity": 7, "total": 210},
        {"price": 50, "name": "Bilheteria", "quantity": 0, "total": 0}
      ],
      "total_quantity": 156,
      "total": 6170
    },
    {
      "name": "Ingresso Vibe 360",
      "type": "MEIA",
      "lotes": [
        {"price": 15, "name": "Lote Promocional", "quantity": 0, "total": 0}
      ],
      "total_quantity": 0,
      "total": 0
    }
  ],
  "courtesys": [
    {
      "name": "Ingresso Vibe 360",
      "event_id": 14,
      "lotes": [
        {"name": "Free", "quantity": 50}
      ]
    }
  ]
};

Map<String, dynamic> _jsonSalesPdv = {
  "money_general": 2880,
  "credit_card_general": 1390,
  "debit_card_general": 1900,
  "total_general": 6170,
  "balances_pdvs": [
    {
      "pdv_name": "Bilheteria",
      "money": 600,
      "credit_card": 1160,
      "debit_card": 1360,
      "total": 3120
    },
    {
      "pdv_name": "MR Multimarcas",
      "money": 2160,
      "credit_card": 40,
      "debit_card": 80,
      "total": 2280
    },
    {"pdv_name": "Cortesias", "money": 0, "credit_card": 0, "debit_card": 0, "total": 0},
    {"pdv_name": "Lê Figaro", "money": 120, "credit_card": 190, "debit_card": 460, "total": 770}
  ]
};

Map<String, dynamic> _salesDates = {
  "quantity_general": 156,
  "total_general": 6170,
  "sales": [
    {"selled_date": "2022-06-07", "quantity": 40, "total": 1530},
    {"selled_date": "2022-06-08", "quantity": 2, "total": 80},
    {"selled_date": "2022-06-13", "quantity": 2, "total": 80},
    {"selled_date": "2022-06-14", "quantity": 21, "total": 840},
    {"selled_date": "2022-06-15", "quantity": 26, "total": 1040},
    {"selled_date": "2022-06-16", "quantity": 65, "total": 2600}
  ]
};

Map<String, dynamic> _withdrawPdvs = {
  "total_current": 6170,
  "total_balance": 6170,
  "total_withdrawals": 0,
  "balances_pdvs": [
    {
      "pdv_name": "Bilheteria",
      "balance_of_withdrawals": 0,
      "current_balance": 3120,
      "cash_balance": 3120
    },
    {
      "pdv_name": "MR Multimarcas",
      "balance_of_withdrawals": 0,
      "current_balance": 2280,
      "cash_balance": 2280
    },
    {"pdv_name": "Cortesias", "balance_of_withdrawals": 0, "current_balance": 0, "cash_balance": 0},
    {
      "pdv_name": "Lê Figaro",
      "balance_of_withdrawals": 0,
      "current_balance": 770,
      "cash_balance": 770
    }
  ]
};

List<dynamic> _pdvs = [
  {
    "id": 32,
    "responsable": "Lê Figaro",
    "name": "Lê Figaro",
    "cpf": null,
    "cnpj": null,
    "phone": null,
    "email": null,
    "place_of_establishment": "Lê Figaro Barbearia",
    "street": "Avenida São Sebastião",
    "number": "1402",
    "neighborhood": "Nossa Sra. de Fátima",
    "city": "Parnaíba",
    "state": "PI",
    "complement": null,
    "user_id": 63,
    "created_at": "2022-04-06 13:38:39",
    "updated_at": "2022-04-06 13:57:36",
    "user": {
      "id": 63,
      "name": "Lê Figaro",
      "login": "lefigaro",
      "cpf": null,
      "created_at": "2022-04-06 13:36:37",
      "updated_at": "2022-04-07 14:58:02",
      "email": null,
      "confirmation_token": null,
      "is_active": false
    }
  },
  {
    "id": 35,
    "responsable": "Resetec",
    "name": "Resetec (teste)",
    "cpf": null,
    "cnpj": null,
    "phone": null,
    "email": null,
    "place_of_establishment": "Resetec",
    "street": "Av. Dep. Pinheiro Machado",
    "number": "822",
    "neighborhood": "Pindorama",
    "city": "Parnaíba",
    "state": "PI",
    "complement": null,
    "user_id": 68,
    "created_at": "2022-04-07 10:10:53",
    "updated_at": "2022-04-07 10:10:53",
    "user": {
      "id": 68,
      "name": "Resetec",
      "login": "resetecteste",
      "cpf": null,
      "created_at": "2022-04-07 02:01:07",
      "updated_at": "2022-06-15 13:28:15",
      "email": null,
      "confirmation_token": null,
      "is_active": false
    }
  }
];

List<dynamic> _lotesSale = [
  {
    "name": "INGRESSO",
    "type": "INTEIRA",
    "lote": {"price": 20, "name": "1° Lote"}
  },
  {
    "name": "INGRESSO CARTÃO",
    "type": "INTEIRA",
    "lote": {"price": 25, "name": "1° Lote"}
  }
];
