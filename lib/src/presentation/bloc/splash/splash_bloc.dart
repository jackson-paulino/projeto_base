import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/featch_user_storage_usecase.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IFeatchUserStorageUsecase featchUserStorage;

  SplashBloc(this.featchUserStorage) : super(SplashInitialState()) {
    on<InitialSplashEvent>(_initialAnimeted);
  }

  void _initialAnimeted(
    InitialSplashEvent event,
    Emitter<SplashState> emitter,
  ) async {
    await Future.delayed(const Duration(milliseconds: 150));

    emitter(SplashInitialAnimetedState(true));
  }
}
