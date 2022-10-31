import 'package:dartz/dartz.dart';

import '../entities/pdv_dates.dart';
import '../errors/errors.dart';
import '../repositories/event_repository.dart';

abstract class IFeatchPdvDatesUsecase {
  Future<Either<IErrorsException, PdvDates>> call(String eventId, String pdvId);
}

class FeatchPdvDatesUsecase implements IFeatchPdvDatesUsecase {
  final IEventRepository _repository;

  FeatchPdvDatesUsecase(this._repository);

  @override
  Future<Either<IErrorsException, PdvDates>> call(String eventId, String pdvId) async {
    if (eventId.isEmpty || eventId == '') {
      return left(const FalireException('eventId is empty or null'));
    }
    if (pdvId.isEmpty || pdvId == '') {
      return left(const FalireException('pdvId is empty or null'));
    }
    return await _repository.featchPdvDates(eventId, pdvId);
  }
}
