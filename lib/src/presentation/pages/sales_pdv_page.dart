import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/data_struct/event_data_struct.dart';
import '../../shared/data_struct/sales_pdv_data_struct.dart';
import '../../shared/utils/extension.dart';
import '../bloc/sales_pdv/sales_pdv_bloc.dart';
import '../bloc/sales_pdv/sales_pdv_event.dart';
import '../bloc/sales_pdv/sales_pdv_state.dart';
import '../widgets/content_sales_pdv.dart';

class SalesPdvPage extends StatelessWidget {
  final EventDataStruct event;
  const SalesPdvPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usecase = context.salesPdvUsecase();
    final bloc = SalesPdvBloc(usecase);
    return Scaffold(
      appBar: AppBar(title: Text(event.eventName)),
      body: BlocBuilder<SalesPdvBloc, SalesPdvState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is SalesPdvInitialState) {
            bloc.add(FeatchSalesPdvEvent(event.eventId));
          } else if (state is SalesPdvFailureState) {
            return Center(child: Text(state.errorException.message));
          } else if (state is SalesPdvFinishedState) {
            final sale = SalesPdvDataStruct.fromDataStruct(state.salesPdv);
            return ContentSalesPdvPage(
              onRefresh: () async => bloc.add(FeatchSalesPdvEvent(event.eventId)),
              sale,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
