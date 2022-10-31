import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/auth_user_usecase.dart';
import '../../../shared/data_struct/auth_data_struct.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final IAuthUserUsecase authUserUsecase;

  SigninBloc(this.authUserUsecase) : super(SigninInitialState()) {
    on<SubmitAuthForm>(_onSubmitAuthForm);
  }

  void _onSubmitAuthForm(
    SubmitAuthForm event,
    Emitter<SigninState> emitter,
  ) async {
    emitter(SigninLoadingState());
    AuthDataStruct data = AuthDataStruct(login: event.username, password: event.password);

    final result = await authUserUsecase(data);


    result.fold(
      (l) => emitter(SigninStateAuthFailure(l)),
      (r) => emitter(SigninStateAuthFinished(r)),
    );
  }
}
