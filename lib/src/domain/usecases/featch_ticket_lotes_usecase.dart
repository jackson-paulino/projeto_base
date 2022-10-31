import 'package:dartz/dartz.dart';

import '../entities/ticket_lotes.dart';
import '../errors/errors.dart';
import '../repositories/event_repository.dart';

abstract class IFeatchTicketLotesUsecase {
  Future<Either<IErrorsException, List<TicketLotes>>> call(String eventId);
}

class FeatchTicketLotesUsecase implements IFeatchTicketLotesUsecase {
  final IEventRepository _repository;

  FeatchTicketLotesUsecase(this._repository);

  @override
  Future<Either<IErrorsException, List<TicketLotes>>> call(String eventId) async {
    if (eventId.isEmpty || eventId == '') {
      return left(const FalireException('eventId is empty or null'));
    }
    return await _repository.featchTicketLotes(eventId);
  }
}
