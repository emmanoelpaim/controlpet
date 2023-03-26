import 'package:controlpet/shared/components/spacers.dart';
import 'package:controlpet/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class BtnRegister extends StatelessWidget {
  const BtnRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildBtn("Registrar", Colors.amber, null),
      ],
    );
  }

  Widget buildBtn(String text, Color btnColor, IconData? iconData) => Container(
        width: 192,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          color: btnColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData != null
                ? Icon(
                    iconData,
                    color: Colors.white,
                  )
                : Container(),
            const WidthSpacer(myWidth: 7.00),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}
