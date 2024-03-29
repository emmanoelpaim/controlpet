import 'package:controlpet/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key,
      required this.focusNode,
      required this.textController,
      required this.label,
      required this.icons});

  final FocusNode focusNode;
  final TextEditingController textController;
  final String label;
  final Icon icons;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHPadding,
      child: TextFormField(
        obscureText: label == "Password" ? true : false,
        controller: textController,
        autofocus: false,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(focusNode);
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(borderRadius: kBorderRadius),
            focusedBorder: OutlineInputBorder(borderRadius: kBorderRadius),
            filled: true,
            fillColor: Colors.white,
            hintText: label,
            prefixIcon: icons),
      ),
    );
  }
}
