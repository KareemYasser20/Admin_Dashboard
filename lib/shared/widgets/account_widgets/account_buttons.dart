import 'package:flutter/material.dart';
import '../../colors.dart';

class AccountsButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressButton;

  const AccountsButton({Key? key, required this.buttonText, required this.onPressButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressButton,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
