import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/data_struct/event_data_struct.dart';
import '../../shared/data_struct/withdraw_pdv_data_struct.dart';
import '../../shared/utils/extension.dart';
import '../bloc/withdraw_pdvs/withdraw_pdvs_bloc.dart';
import '../bloc/withdraw_pdvs/withdraw_pdvs_event.dart';
import '../bloc/withdraw_pdvs/withdraw_pdvs_state.dart';
import '../widgets/content_withdraw_pdv.dart';

class WithdrawSalesPage extends StatelessWidget {
  final EventDataStruct event;
  const WithdrawSalesPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usecase = context.withdrawPdvUsecase();
    final bloc = WithdrawPdvsBloc(usecase);
    return Scaffold(
      appBar: AppBar(title: Text(event.eventName)),
      body: BlocBuilder<WithdrawPdvsBloc, WithdrawPdvsState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is WithdrawPdvsInitialState) {
            bloc.add(FeatchWithdrawPdvsEvent(event.eventId));
          } else if (state is WithdrawPdvsFailureState) {
            return Center(child: Text(state.errorException.message));
          } else if (state is WithdrawPdvsFinishedState) {
            final withdrawPdv = WithdrawPdvDataStruct.fromDataStruct(state.withdrawPdv);
            return ContentWithdrawPdv(
              onRefresh: () async => bloc.add(FeatchWithdrawPdvsEvent(event.eventId)),
              withdrawPdv,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
