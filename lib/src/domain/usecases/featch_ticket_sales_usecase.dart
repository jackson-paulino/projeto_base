import 'package:dartz/dartz.dart';

import '../entities/balance_tickets.dart';
import '../errors/errors.dart';
import '../repositories/event_repository.dart';

abstract class IFeatchTicketSalesUsecase {
  Future<Either<IErrorsException, BalanceTickets>> call(String eventId);
}

class FeatchTicketSalesUsecase implements IFeatchTicketSalesUsecase {
  final IEventRepository _repository;

  FeatchTicketSalesUsecase(this._repository);

  @override
  Future<Either<IErrorsException, BalanceTickets>> call(String eventId) async {
    if (eventId.isEmpty || eventId == '') {
      return left(const FalireException('eventId is empty or null'));
    }
    return await _repository.featchTicketSales(eventId);
  }
}
