import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isEmpty ? 'Ingresa el nombre' : null,
        ),
        formKey: formKey,
      ));
    });

    on<LastnameChanged>((event, emit) {
      emit(state.copyWith(
        lastname: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isEmpty ? 'Ingresa el apellido' : null,
        ),
        formKey: formKey,
      ));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isEmpty ? 'Ingresa el correo' : null,
        ),
        formKey: formKey,
      ));
    });

    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(
        phone: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isEmpty ? 'Ingresa el telefono' : null,
        ),
        formKey: formKey,
      ));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error: event.password.value.isEmpty
              ? 'Ingresa la contraseña'
              : event.password.value.length < 6
                  ? 'La contraseña debe tener mas de 6 caracteres'
                  : null,
        ),
        formKey: formKey,
      ));
    });
    on<ConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(
        confirmPassword: BlocFormItem(
          value: event.confirmPassword.value,
          error: event.confirmPassword.value.isEmpty
              ? 'Confirma la contraseña'
              : event.confirmPassword.value.length < 6
                  ? 'Debe tener mas de 6 caracteres'
                  : event.confirmPassword.value != state.password.value
                      ? 'Las contrasenãs no coinciden'
                      : null,
        ),
        formKey: formKey,
      ));
    });

    on<FormSubmit>((event, emit) {
      print('Name: ${state.name.value}');
      print('Lastname: ${state.lastname.value}');
      print('Phone: ${state.phone.value}');
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');
      print('Confirm password: ${state.confirmPassword.value}');
    });

    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });
  }
}
