import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/data_struct/event_data_struct.dart';
import '../bloc/pdvs/pdvs_bloc.dart';
import '../bloc/pdvs/pdvs_event.dart';
import '../bloc/pdvs/pdvs_state.dart';
import '../../shared/utils/extension.dart';
import '../widgets/content_pdvs.dart';

class PdvPage extends StatelessWidget {
  final EventDataStruct event;
  const PdvPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.pdvsBloc();
    return Scaffold(
      appBar: AppBar(title: Text(event.eventName)),
      body: BlocBuilder<PdvsBloc, PdvsState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is PdvsInitialState) {
            bloc.add(FeatchPdvsEvent(event.eventId));
          } else if (state is PdvsFailureState) {
            return Center(child: Text(state.errorException.message));
          } else if (state is PdvsFinishedState) {
            if (state.eventId == event.eventId) {
              return ContentPdvs(
                  onRefresh: () async => bloc.add(FeatchPdvsEvent(event.eventId)),
                  pdvs: state.pdvs);
            } else {
              bloc.add(FeatchPdvsEvent(event.eventId));
              return const Center(child: CircularProgressIndicator());
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
