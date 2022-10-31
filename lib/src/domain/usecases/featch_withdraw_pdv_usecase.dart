import 'package:dartz/dartz.dart';

import '../entities/withdraw_pdv.dart';
import '../errors/errors.dart';
import '../repositories/event_repository.dart';

abstract class IFeatchWithdrawPdvUsecase {
  Future<Either<IErrorsException, WithdrawPdv>> call(String eventId);
}

class FeatchWithdrawPdvUsecase implements IFeatchWithdrawPdvUsecase {
  final IEventRepository _repository;

  FeatchWithdrawPdvUsecase(this._repository);

  @override
  Future<Either<IErrorsException, WithdrawPdv>> call(String eventId) async {
    if (eventId.isEmpty || eventId == '') {
      return left(const FalireException('eventId is empty or null'));
    }
    return await _repository.featchWithdrawPdv(eventId);
  }
}
