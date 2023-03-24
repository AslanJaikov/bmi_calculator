import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget(
      {super.key, this.GenderText, this.GenderIcon, this.GenderIdentity});

  final String? GenderText;
  final String? GenderIdentity;
  final IconData? GenderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          GenderIcon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          GenderText!,
          style: kLabelStyleText,
        ),
        Text(
          GenderIdentity!,
          style: kGenderIdentityTextStyle,
        ),
      ],
    );
  }
}
