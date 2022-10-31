import 'package:dartz/dartz.dart';

import '../entities/pdv.dart';
import '../errors/errors.dart';
import '../repositories/event_repository.dart';

abstract class IFeatchPdvsUsecase {
  Future<Either<IErrorsException, List<Pdv>>> call(String eventId);
}

class FeatchPdvsUsecase implements IFeatchPdvsUsecase {
  final IEventRepository _repository;

  FeatchPdvsUsecase(this._repository);

  @override
  Future<Either<IErrorsException, List<Pdv>>> call(String eventId) async {
    if (eventId.isEmpty || eventId == '') {
      return left(const FalireException('eventId is empty or null'));
    }
    return await _repository.featchPdvs(eventId);
  }
}
