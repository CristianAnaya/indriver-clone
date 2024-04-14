import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indriver_clone_flutter/src/domain/models/User.dart';
import 'package:indriver_clone_flutter/src/domain/utils/Resource.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  toUser() => User(
        name: name.value,
        lastname: lastname.value,
        email: email.value,
        phone: phone.value,
        password: password.value,
      );

  const RegisterState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.lastname = const BlocFormItem(error: 'Ingresa el apellido'),
    this.email = const BlocFormItem(error: 'Ingresa el correo'),
    this.phone = const BlocFormItem(error: 'Ingresa el telefono'),
    this.password = const BlocFormItem(error: 'Ingresa una contraseña'),
    this.confirmPassword = const BlocFormItem(error: 'Confirma la contraseña'),
    this.response,
    this.formKey,
  });

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      response: response,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [
        name,
        lastname,
        email,
        phone,
        password,
        confirmPassword,
        response,
      ];
}
