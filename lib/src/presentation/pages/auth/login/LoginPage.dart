import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indriver_clone_flutter/src/domain/utils/Resource.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/LoginContent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 120, 150, 202),
        body: BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final response = state.response;
        if (response is ErrorData) {
          print('Success data ${response.message}');
          Fluttertoast.showToast(
            msg: response.message,
            toastLength: Toast.LENGTH_SHORT,
          );
        } else if (response is Success) {
          print('Success data ${response.data}');
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final response = state.response;
          if (response is Loading) {
            return Stack(
              children: [
                LoginContent(state),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }
          return LoginContent(state);
        },
      ),
    ));
  }
}
