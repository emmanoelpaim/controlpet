import 'package:controlpet/modules/register/bloc/register_bloc.dart';
import 'package:controlpet/modules/register/widgets/text_data_widget.dart';
import 'package:controlpet/shared/components/loader.dart';
import 'package:controlpet/shared/components/spacers.dart';
import 'package:controlpet/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});
  final String title;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late FocusNode usernameFocus;
  late FocusNode passwordFocus;
  late TextEditingController userName;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    usernameFocus = FocusNode();
    passwordFocus = FocusNode();
    userName = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    usernameFocus.dispose();
    passwordFocus.dispose();
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterError) {
            buildErrorLayout();
          } else if (state is RegisterLoaded) {
            clearTextData();
            Navigator.of(context)
                .pushNamed('/dashboard', arguments: state.username);
          }
        },
        builder: (context, state) {
          if (state is RegisterLoading) {
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
              const TextData(message: "Petz"),
              HeightSpacer(myHeight: kSpacing),
              TextFormField(
                focusNode: usernameFocus,
                controller: userName,
              ),
              HeightSpacer(myHeight: kSpacing),
              TextFormField(
                focusNode: passwordFocus,
                controller: password,
              ),
              HeightSpacer(myHeight: kSpacing),
              HeightSpacer(myHeight: kSpacing),
              const SizedBox(
                height: 40,
              ),
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
