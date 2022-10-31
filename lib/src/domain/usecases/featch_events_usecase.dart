import 'package:dartz/dartz.dart';

import '../entities/event.dart';
import '../errors/errors.dart';
import '../repositories/event_repository.dart';

abstract class IFeatchEventsUsecase {
  Future<Either<IErrorsException, List<Event>>> call({bool eventWon = false});
}

class FeatchEventsUsecase implements IFeatchEventsUsecase {
  final IEventRepository _repository;

  FeatchEventsUsecase(this._repository);

  @override
  Future<Either<IErrorsException, List<Event>>> call({bool eventWon = false}) async =>
      await _repository.featchEvents(eventWon: eventWon);
}
