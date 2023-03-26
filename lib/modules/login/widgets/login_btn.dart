import 'package:controlpet/modules/login/bloc/login_bloc.dart';
import 'package:controlpet/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn(
      {super.key,
      required this.focusNode,
      required this.userName,
      required this.password});

  final FocusNode focusNode;
  final TextEditingController userName;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHPadding,
      child: OutlinedButton(
        focusNode: focusNode,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.amber, width: 1),
            minimumSize: const Size(double.infinity, 54),
            backgroundColor: Colors.amber[200]),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context)
              .add(Login(userName.text, password.text));
        },
        child: const Text(
          'Login',
          style: TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
