import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/domain/usecases/auth/AuthUseCases.dart';
import 'package:indriver_clone_flutter/src/domain/utils/Resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<LoginInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
          email: BlocFormItem(
              value: event.email.value,
              error: event.email.value.isEmpty ? 'Ingresa el email' : null),
          formKey: formKey));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
          password: BlocFormItem(
              value: event.password.value,
              error: event.password.value.isEmpty
                  ? 'Ingresa la contraseña'
                  : event.password.value.length < 6
                      ? 'Minimo 6 caracteres'
                      : null),
          formKey: formKey));
    });

    on<FormSumbit>((event, emit) async {
      print('Success data ${state.email.value}');
      print('Success data ${state.password.value}');

      emit(
        state.copyWith(
          response: Loading(),
          formKey: formKey,
        ),
      );
      Resource response =
          await authUseCases.login.run(state.email.value, state.password.value);
      emit(
        state.copyWith(
          response: response,
          formKey: formKey,
        ),
      );
    });
  }
}
