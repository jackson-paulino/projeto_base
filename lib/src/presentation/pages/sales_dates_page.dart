import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/data_struct/event_data_struct.dart';
import '../../shared/data_struct/sales_dates_data_struct.dart';
import '../bloc/sales_dates/sales_dates_bloc.dart';
import '../bloc/sales_dates/sales_dates_event.dart';
import '../bloc/sales_dates/sales_dates_state.dart';
import '../../shared/utils/extension.dart';
import '../widgets/content_sales_dates.dart';

class SalesDatesPage extends StatelessWidget {
  final EventDataStruct event;
  const SalesDatesPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usecase = context.salesDatesUsecase();
    final bloc = SalesDatesBloc(usecase);
    return Scaffold(
      appBar: AppBar(title: Text(event.eventName)),
      body: BlocBuilder<SalesDatesBloc, SalesDatesState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is SalesDatesInitialState) {
            bloc.add(FeatchSalesDatesEvent(event.eventId));
          } else if (state is SalesDatesFailureState) {
            return Center(child: Text(state.errorException.message));
          } else if (state is SalesDatesFinishedState) {
            final salesDates = SalesDatesDataStruct.fromDataStruct(state.salesDates);
            return ContentSalesDates(
              onRefresh: () async => bloc.add(FeatchSalesDatesEvent(event.eventId)),
              salesDates,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
