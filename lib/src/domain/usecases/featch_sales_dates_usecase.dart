import 'package:dartz/dartz.dart';

import '../entities/sales_dates.dart';
import '../errors/errors.dart';
import '../repositories/event_repository.dart';

abstract class IFeatchSalesDatesUsecase {
  Future<Either<IErrorsException, SalesDates>> call(String eventId);
}

class FeatchSalesDatesUsecase implements IFeatchSalesDatesUsecase {
  final IEventRepository _repository;

  FeatchSalesDatesUsecase(this._repository);

  @override
  Future<Either<IErrorsException, SalesDates>> call(String eventId) async {
    if (eventId.isEmpty || eventId == '') {
      return left(const FalireException('eventId is empty or null'));
    }
    return await _repository.featchSalesDates(eventId);
  }
}
