import '../../../domain/entities/pdv.dart';
import '../../../domain/errors/errors.dart';

abstract class PdvsState {}

class PdvsInitialState extends PdvsState {}

class PdvsLoadingState extends PdvsState {}

class PdvsFinishedState implements PdvsState {
  final List<Pdv> pdvs;
  final String eventId;

  PdvsFinishedState(this.pdvs, this.eventId);
}

class PdvsFailureState implements PdvsState {
  final IErrorsException errorException;

  PdvsFailureState(this.errorException);
}
