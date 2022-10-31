import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/utils/extension.dart';
import '../../shared/data_struct/event_data_struct.dart';
import '../bloc/ticket_lotes/ticket_lotes_bloc.dart';
import '../bloc/ticket_lotes/ticket_lotes_event.dart';
import '../bloc/ticket_lotes/ticket_lotes_state.dart';
import '../widgets/content_ticket_lotes.dart';

class TicketLotesPage extends StatelessWidget {
  final EventDataStruct event;
  const TicketLotesPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usecase = context.ticketLotesUsecase();
    final bloc = TicketLotesBloc(usecase);
    return Scaffold(
      appBar: AppBar(title: Text(event.eventName)),
      body: BlocBuilder<TicketLotesBloc, TicketLotesState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is TicketLotesInitialState) {
            bloc.add(FeatchTicketLotesEvent(event.eventId));
          } else if (state is TicketLotesFailureState) {
            return Center(child: Text(state.errorException.message));
          } else if (state is TicketLotesFinishedState) {
            return ContentTicketLotes(
              onRefresh: () async => bloc.add(FeatchTicketLotesEvent(event.eventId)),
              state.ticketLotes,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
