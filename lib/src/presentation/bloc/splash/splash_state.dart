import '../../../domain/errors/errors.dart';

abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashInitialAnimetedState extends SplashState {
  final bool animated;
  SplashInitialAnimetedState(this.animated);
}

class SplashFeatchFailureState implements SplashState {
  final IErrorsException errorException;

  SplashFeatchFailureState(this.errorException);
}
