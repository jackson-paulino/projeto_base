import 'package:dartz/dartz.dart';

import '../entities/sales_pdv.dart';
import '../errors/errors.dart';
import '../repositories/event_repository.dart';

abstract class IFeatchSalesPdvUsecase {
  Future<Either<IErrorsException, SalesPdv>> call(String eventId);
}

class FeatchSalesPdvUsecase implements IFeatchSalesPdvUsecase {
  final IEventRepository _repository;

  FeatchSalesPdvUsecase(this._repository);

  @override
  Future<Either<IErrorsException, SalesPdv>> call(String eventId) async {
    if (eventId.isEmpty || eventId == '') {
      return left(const FalireException('eventId is empty or null'));
    }
    return await _repository.featchSalesPdv(eventId);
  }
}
