import '../../../domain/entities/sales_pdv.dart';
import '../../../domain/errors/errors.dart';

abstract class SalesPdvState {}

class SalesPdvInitialState extends SalesPdvState {}

class SalesPdvLoadingState extends SalesPdvState {}

class SalesPdvFinishedState implements SalesPdvState {
  final SalesPdv salesPdv;

  SalesPdvFinishedState(this.salesPdv);
}

class SalesPdvFailureState implements SalesPdvState {
  final IErrorsException errorException;

  SalesPdvFailureState(this.errorException);
}
