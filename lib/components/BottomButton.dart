import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, this.buttonText, this.buttonFunction});

  final String? buttonText;
  final Function()? buttonFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText!,
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: kButtomContainerHieght,
      ),
    );
  }
}
