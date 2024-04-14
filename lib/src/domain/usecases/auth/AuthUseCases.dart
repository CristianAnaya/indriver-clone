import 'package:indriver_clone_flutter/src/domain/usecases/auth/LoginUseCase.dart';
import 'package:indriver_clone_flutter/src/domain/usecases/auth/RegisterUseCase.dart';

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;

  AuthUseCases({
    required this.login,
    required this.register,
  });
}
