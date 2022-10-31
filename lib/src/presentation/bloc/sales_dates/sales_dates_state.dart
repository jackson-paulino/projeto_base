import '../../../domain/entities/sales_dates.dart';
import '../../../domain/errors/errors.dart';

abstract class SalesDatesState {}

class SalesDatesInitialState extends SalesDatesState {}

class SalesDatesLoadingState extends SalesDatesState {}

class SalesDatesFinishedState implements SalesDatesState {
  final SalesDates salesDates;

  SalesDatesFinishedState(this.salesDates);
}

class SalesDatesFailureState implements SalesDatesState {
  final IErrorsException errorException;

  SalesDatesFailureState(this.errorException);
}
