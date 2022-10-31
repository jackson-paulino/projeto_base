import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../shared/utils/extension.dart';
import '../../shared/data_struct/auth_user_state.dart';
import '../bloc/signin/signin_bloc.dart';
import '../bloc/signin/signin_event.dart';
import '../bloc/signin/signin_state.dart';
import '../bloc/storage/storage_event.dart';
import 'form_text_field/custom_form_text_field.dart';
import 'form_text_field/custom_form_text_field_password.dart';
import 'form_text_field/form/custom_form.dart';
import 'custom_button/custom_button.dart';

class SigninForm extends StatefulWidget {
  final String? login;
  final String? password;

  const SigninForm({Key? key, this.login, this.password}) : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  bool isvalid = false;
  @override
  Widget build(BuildContext context) {
    final authUserUsecase = context.authUserUsecase();
    var signinBloc = SigninBloc(authUserUsecase);
    var storageBloc = context.storageBloc();
    return BlocBuilder<SigninBloc, SigninState>(
      bloc: signinBloc,
      builder: (context, signinState) {
        if (signinState is SigninStateAuthFinished) {
          storageBloc.add(SubmitUserStorageEvent(signinState.user));
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/home');
          });
          return const SizedBox(height: 300, child: Center(child: CircularProgressIndicator()));
        }
        return CustomForm(
          autovalidateMode: AutovalidateMode.disabled,
          builder: (
            BuildContext context,
            Map<String, dynamic> Function() getValidatedFormState,
          ) =>
              Column(
            children: [
              CustomFormTextField(
                name: 'login',
                label: 'Login',
                hint: 'Digite seu Login',
                initialValue: widget.login,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                onChanged: (value) {
                  setState(() => isvalid = getValidatedFormState()['isValid']);
                },
                validators: [
                  FormBuilderValidators.required(
                    errorText: 'Digite seu Login',
                  )
                ],
              ),
              const SizedBox(height: 15),
              CustomFormTextFieldPassword(
                name: 'password',
                label: 'Senha',
                hint: 'Senha',
                onChanged: (_) {
                  setState(() => isvalid = getValidatedFormState()['isValid']);
                },
              ),
              const SizedBox(height: 24),
              if (signinState is SigninLoadingState)
                const CircularProgressIndicator()
              else
                CustomButton(
                  text: const Text(
                    'Entrar',
                    style: TextStyle(
                      color: Color(0XFFEBF7FF),
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  colorCode: 0xFF2047E0,
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  borderRadius: 16,
                  onPressed: () async {
                    final signinForm = AuthUserForm.fromFormFields(
                      getValidatedFormState(),
                    );
                    if (isvalid) {
                      signinBloc.add(
                        SubmitAuthForm(
                          username: signinForm.username!,
                          password: signinForm.password!,
                        ),
                      );
                    }
                  },
                ),
              const SizedBox(height: 15),
              if (signinState is SigninStateAuthFailure)
                Text(
                  signinState.errorException.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                )
            ],
          ),
        );
      },
    );
  }
}
