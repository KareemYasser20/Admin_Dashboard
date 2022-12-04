import 'package:flutter/material.dart';
import '../../colors.dart';

class AccountQuestion extends StatelessWidget {

  final String accountQuestion;
  final String buttonText;
  final VoidCallback onTapButton;

  const AccountQuestion({Key ? key, required this.accountQuestion , required this.buttonText , required this.onTapButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          accountQuestion,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(5.0),
        ),
        GestureDetector(
          onTap: onTapButton,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: primaryColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}

