import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  RegisterState state;

  RegisterContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: const [
                  Color.fromARGB(255, 12, 38, 145),
                  Color.fromARGB(255, 34, 156, 249)
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotated(context),
                SizedBox(height: 100),
                _textRegisterRotated(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35)),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: const [
                      Color.fromARGB(255, 245, 245, 245),
                      Color.fromARGB(255, 189, 189, 189)
                    ])),
            child: Stack(
              children: [
                _imageBackground(context),
                SingleChildScrollView(
                  child: Column(children: [
                    _imageBanner(),
                    DefaultTextFieldOutlined(
                      text: 'Nombre',
                      icon: Icons.person_outline,
                      onChanged: (text) {
                        context
                            .read<RegisterBloc>()
                            .add(NameChanged(name: BlocFormItem(value: text)));
                      },
                      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                      validator: (value) {
                        return state.name.error;
                      },
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Apellido',
                      icon: Icons.person_2_outlined,
                      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(LastnameChanged(
                            lastname: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.lastname.error;
                      },
                    ),
                    DefaultTextFieldOutlined(
                      text: 'email',
                      icon: Icons.email,
                      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(
                              EmailChanged(
                                email: BlocFormItem(value: text),
                              ),
                            );
                      },
                      validator: (value) {
                        return state.email.error;
                      },
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Telefono',
                      icon: Icons.phone_outlined,
                      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(
                            PhoneChanged(phone: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.phone.error;
                      },
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Contraseña',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(PasswordChanged(
                            password: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.password.error;
                      },
                    ),
                    DefaultTextFieldOutlined(
                      text: 'Confirmar contraseña',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(left: 40, right: 40, top: 15),
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(ConfirmPasswordChanged(
                            confirmPassword: BlocFormItem(value: text)));
                      },
                      validator: (value) {
                        return state.confirmPassword.error;
                      },
                    ),
                    DefaultButton(
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          context.read<RegisterBloc>().add(FormSubmit());
                          context.read<RegisterBloc>().add(FormReset());
                        } else {}
                      },
                      text: 'Crear usuario',
                      margin: EdgeInsets.only(top: 30, left: 60, right: 60),
                    ),
                    SizedBox(height: 25),
                    _separatorOr(),
                    SizedBox(height: 10),
                    _textIAlReadyHaveAccount(context)
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _textIAlReadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Ya tienes cuenta?', style: TextStyle(color: Colors.grey[100])),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () => {Navigator.pushNamed(context, 'login')},
          child: Text(
            'Inicia sesión',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 50),
      child: Image.asset(
        'assets/img/destination.png',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.4,
        opacity: AlwaysStoppedAnimation(0.3),
      ),
    );
  }

  Widget _separatorOr() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5)),
      Text('O', style: TextStyle(color: Colors.white, fontSize: 17)),
      Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5))
    ]);
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 60, bottom: 30),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/delivery.png',
        width: 180,
        height: 180,
      ),
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
        quarterTurns: 1,
        child: Text('REGISTER',
            style: TextStyle(
                fontSize: 27,
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, 'login')},
      child: RotatedBox(
          quarterTurns: -1,
          child: Text('LOGIN',
              style: TextStyle(fontSize: 24, color: Colors.white))),
    );
  }
}
