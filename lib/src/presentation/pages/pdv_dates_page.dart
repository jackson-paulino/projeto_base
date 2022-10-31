import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/data_struct/event_data_struct.dart';
import '../../shared/data_struct/pdv_dates_data_struct.dart';
import '../bloc/pdv_dates/pdv_dates_bloc.dart';
import '../bloc/pdv_dates/pdv_dates_event.dart';
import '../bloc/pdv_dates/pdv_dates_state.dart';
import '../../shared/utils/extension.dart';
import '../widgets/content_pdv_dates.dart';
import '../widgets/search_pdv_form.dart';

class PdvDatesPage extends StatelessWidget {
  final EventDataStruct event;

  const PdvDatesPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final user = context.user();
    final usecase = context.pdvDatesUsecase();
    final bloc = PdvDatesBloc(usecase);
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: RefreshIndicator(
        onRefresh: () async {
          context.pdvsBlocAdd(event.eventId);
          // ignore: invalid_use_of_visible_for_testing_member
          bloc.emit(PdvDatesInitialState());
        },
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const Text(
              'Vendas diaria PDV',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 15),
            SearchPdvForm(
                event: event,
                select: (String value) => bloc.add(FeatchPdvDatesEvent(event.eventId, value))),
            BlocBuilder<PdvDatesBloc, PdvDatesState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is PdvDatesInitialState) {
                  return const SizedBox();
                } else if (state is PdvDatesFinishedState) {
                  final pdvDates = PdvDatesDataStruct.fromDataStruct(state.salesDates);
                  return ContentPdvDates(pdvDates: pdvDates);
                }
                return Padding(
                    padding: EdgeInsets.only(top: size.height * 0.25),
                    child: const Center(child: CircularProgressIndicator()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
