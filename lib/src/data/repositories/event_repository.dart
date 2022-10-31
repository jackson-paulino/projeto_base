import 'package:dartz/dartz.dart';

import '../../domain/entities/balance_tickets.dart';
import '../../domain/entities/event.dart';
import '../../domain/entities/pdv.dart';
import '../../domain/entities/pdv_dates.dart';
import '../../domain/entities/sales_dates.dart';
import '../../domain/entities/sales_pdv.dart';
import '../../domain/entities/ticket_lotes.dart';
import '../../domain/entities/withdraw_pdv.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/event_repository.dart';
import '../adapters/balance_tickets_adapter.dart';
import '../adapters/event_adapter.dart';
import '../adapters/pdv_adapter.dart';
import '../adapters/pdv_dates.dart';
import '../adapters/sales_dates_adapter.dart';
import '../adapters/sales_pdv_adapter.dart';
import '../adapters/ticket_lotes_adapter.dart';
import '../adapters/withdraw_pdv.dart';
import '../datasources/featch_events_datasource.dart';
import '../datasources/featch_pdv_dates_datasource.dart';
import '../datasources/featch_pdvs_datasource.dart';
import '../datasources/featch_sales_dates_datasource.dart';
import '../datasources/featch_sales_pdv_datasource.dart';
import '../datasources/featch_ticket_lotes_datasource.dart';
import '../datasources/featch_ticket_sales_datasource.dart';
import '../datasources/featch_withdraw_pdv_datasource.dart';

class EventRepository implements IEventRepository {
  final IFeatchEventDatasource _featchEvents;
  final IFeatchTicketSalesDatasource _featchTicketSales;
  final IFeatchSalesPdvDatasource _featchSalesPdv;
  final IFeatchSalesDatesDatasource _featchSalesDates;
  final IFeatchWithdrawPdvDatasource _featchWithdrawPdv;
  final IFeatchPdvsDatasource _featchPdvs;
  final IFeatchTicketLotesDatasource _featchTicketLotes;
  final IFeatchPdvDatesDatasource _featchPdvDates;

  EventRepository(
      this._featchEvents,
      this._featchTicketSales,
      this._featchSalesPdv,
      this._featchSalesDates,
      this._featchWithdrawPdv,
      this._featchPdvs,
      this._featchTicketLotes,
      this._featchPdvDates);

  @override
  Future<Either<IErrorsException, List<Event>>> featchEvents({bool eventWon = false}) async {
    try {
      final result = await _featchEvents.featchEvents(eventWon: eventWon);
      List<Event> list = <Event>[];

      for (var element in result) {
        final event = EventAdapter.fromJson(element);
        list.add(event);
      }

      return right(list);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, BalanceTickets>> featchTicketSales(String eventId) async {
    try {
      final result = await _featchTicketSales.featchTicketSales(eventId);
      final balance = BalanceTicketsAdapter.fromJson(result);

      return right(balance);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, SalesPdv>> featchSalesPdv(String eventId) async {
    try {
      final result = await _featchSalesPdv.featchSalesPdv(eventId);
      final salesPdv = SalesPdvAdapter.fromJson(result);

      return right(salesPdv);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, SalesDates>> featchSalesDates(String eventId) async {
    try {
      final result = await _featchSalesDates.featchSalesDates(eventId);
      final salesPdv = SalesDatesAdapter.fromJson(result);

      return right(salesPdv);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, WithdrawPdv>> featchWithdrawPdv(String eventId) async {
    try {
      final result = await _featchWithdrawPdv.featchWithdrawPdv(eventId);
      final withdrawPdv = WithdrawPdvAdapter.fromJson(result);

      return right(withdrawPdv);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, List<Pdv>>> featchPdvs(String eventId) async {
    try {
      final result = await _featchPdvs.featchPdvs(eventId);

      List<Pdv> list = <Pdv>[];

      for (var element in result) {
        final item = PdvAdapter.fromJson(element);
        list.add(item);
      }

      return right(list);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, List<TicketLotes>>> featchTicketLotes(String eventId) async {
    try {
      final result = await _featchTicketLotes.featchTicketLotes(eventId);

      List<TicketLotes> list = <TicketLotes>[];

      for (var element in result) {
        final item = TicketLotesAdapter.fromJson(element);
        list.add(item);
      }

      return right(list);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<IErrorsException, PdvDates>> featchPdvDates(String eventId, String pdvId) async {
    try {
      final result = await _featchPdvDates.featchPdvDates(
        eventId,
        pdvId,
      );

      final pdvDates = PdvDatesAdapter.fromJson(result);

      return right(pdvDates);
    } on IErrorsException catch (e) {
      return left(e);
    }
  }
}
