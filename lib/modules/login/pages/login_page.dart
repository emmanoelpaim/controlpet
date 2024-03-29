import 'package:controlpet/modules/login/bloc/login_bloc.dart';
import 'package:controlpet/modules/login/widgets/btn_register.dart';
import 'package:controlpet/modules/login/widgets/login_btn.dart';
import 'package:controlpet/modules/login/widgets/social_signin.dart';
import 'package:controlpet/modules/login/widgets/text_data_widget.dart';
import 'package:controlpet/modules/login/widgets/text_form_field.dart';
import 'package:controlpet/shared/components/image_builder.dart';
import 'package:controlpet/shared/components/loader.dart';
import 'package:controlpet/shared/components/spacers.dart';
import 'package:controlpet/shared/constants/constants.dart';
import 'package:controlpet/shared/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    userName = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    loginBtnFocus.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            buildErrorLayout();
          } else if (state is LoginLoaded) {
            clearTextData();
            Navigator.of(context)
                .pushNamed('/dashboard', arguments: state.username);
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return LoadingWidget(child: buildInitialInput());
          } else {
            return buildInitialInput();
          }
        },
      ),
    );
  }

  Widget buildInitialInput() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(
            children: [
              HeightSpacer(myHeight: kSpacing),
              ImageBuilder(imagePath: loginImages[0]),
              const TextData(message: "Petz"),
              HeightSpacer(myHeight: kSpacing),
              InputField(
                focusNode: usernameFocus,
                textController: userName,
                label: "Username",
                icons: const Icon(Icons.person, color: Colors.black),
              ),
              HeightSpacer(myHeight: kSpacing),
              InputField(
                focusNode: passwordFocus,
                textController: password,
                label: "Password",
                icons: const Icon(Icons.lock, color: Colors.black),
              ),
              HeightSpacer(myHeight: kSpacing),
              LoginBtn(
                focusNode: loginBtnFocus,
                userName: userName,
                password: password,
              ),
              HeightSpacer(myHeight: kSpacing),
              const SocialSignIn(),
              const SizedBox(
                height: 40,
              ),
              const BtnRegister()
            ],
          ),
        ),
      );

  ScaffoldFeatureController buildErrorLayout() =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username/password!'),
        ),
      );

  clearTextData() {
    userName.clear();
    password.clear();
  }
}
