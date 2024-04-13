import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/login/bloc/LoginState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextField.dart';

class LoginContent extends StatelessWidget {
  LoginState state;
  LoginContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: const [
                    Color.fromARGB(255, 12, 38, 145),
                    Color.fromARGB(255, 34, 156, 249)
                  ])),
              padding: EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // HORIZONTAL
                mainAxisAlignment: MainAxisAlignment.center, // VERTICAL
                children: [
                  _textLoginRotated(),
                  SizedBox(height: 50),
                  _textRegisterRotated(context),
                  SizedBox(height: 90),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(left: 60, bottom: 60),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: const [
                      Color.fromARGB(255, 14, 29, 166),
                      Color.fromARGB(255, 30, 112, 227)
                    ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(35))),
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    _textWelcome('Welcome'),
                    _textWelcome('back...'),
                    _imageCar(),
                    _textLogin(),
                    DefaultTextField(
                        text: "Email",
                        validator: (value) {
                          return state.email.error;
                        },
                        onChanged: (text) {
                          context.read<LoginBloc>().add(
                              EmailChanged(email: BlocFormItem(value: text)));
                        },
                        icon: Icons.email_outlined),
                    DefaultTextField(
                      text: "Password",
                      icon: Icons.lock,
                      validator: (value) {
                        return state.password.error;
                      },
                      onChanged: (text) {
                        context.read<LoginBloc>().add(PasswordChanged(
                            password: BlocFormItem(value: text)));
                      },
                      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    DefaultButton(
                        text: 'LOGIN',
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            context.read<LoginBloc>().add(FormSumbit());
                          } else {
                            print('El formulairo no es valido');
                          }
                        }),
                    _separatorOr(),
                    _textDontHaveAccount(context)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('No tienes cuenta?',
          style: TextStyle(color: Colors.grey[100], fontSize: 17)),
      SizedBox(width: 7),
      GestureDetector(
        onTap: () => {Navigator.pushNamed(context, 'register')},
        child: Text(
          'Registrate',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      SizedBox(height: 50)
    ]);
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text(
          'O',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        )
      ],
    );
  }

  Widget _textLogin() {
    return Text('Login',
        style: TextStyle(
            fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold));
  }

  Widget _imageCar() {
    return Container(
        alignment: Alignment.centerRight,
        child: Image.asset('assets/img/car.png', width: 150, height: 150));
  }

  Widget _textWelcome(String text) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: -1,
      child: Text('Login',
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold)),
    );
  }

  Widget _textRegisterRotated(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, 'register')},
      child: RotatedBox(
        quarterTurns: -1,
        child: Text('Registros',
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}
