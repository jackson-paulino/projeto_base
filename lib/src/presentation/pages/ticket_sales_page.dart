import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/data_struct/balance_ticket_data_struct.dart';
import '../../shared/data_struct/event_data_struct.dart';
import '../../shared/utils/extension.dart';
import '../bloc/ticket_sales/ticket_sales_bloc.dart';
import '../bloc/ticket_sales/ticket_sales_event.dart';
import '../bloc/ticket_sales/ticket_sales_state.dart';
import '../widgets/content_ticket_sales.dart';

class TicketSalesPage extends StatelessWidget {
  final EventDataStruct event;
  const TicketSalesPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usecase = context.ticketSalesUsecase();
    final bloc = TicketSalesBloc(usecase);
    return Scaffold(
      appBar: AppBar(title: Text(event.eventName)),
      body: BlocBuilder<TicketSalesBloc, TicketSalesState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is TicketSalesInitialState) {
            bloc.add(FeatchTicketSalesEvent(event.eventId));
          } else if (state is TicketSalesFailureState) {
            return Center(child: Text(state.errorException.message));
          } else if (state is TicketSalesFinishedState) {
            final balance = BalanceTicketDataStruct.fromDataStruct(state.balance);
            return ContentTicketSales(
              onRefresh: () async => bloc.add(FeatchTicketSalesEvent(event.eventId)),
              balance,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
