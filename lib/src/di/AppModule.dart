import 'package:indriver_clone_flutter/src/data/dataSource/remote/service/AuthService.dart';
import 'package:indriver_clone_flutter/src/data/resporitoy/AuthRepositoryImpl.dart';
import 'package:indriver_clone_flutter/src/domain/repository/AuthRepository.dart';
import 'package:indriver_clone_flutter/src/domain/usecases/auth/AuthUseCases.dart';
import 'package:indriver_clone_flutter/src/domain/usecases/auth/LoginUseCase.dart';
import 'package:indriver_clone_flutter/src/domain/usecases/auth/RegisterUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);

  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
      );
}
