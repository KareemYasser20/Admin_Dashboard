import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final FormFieldValidator<String>? validatorFunction;
  final bool obscureValue;
  final bool isPasswordTextField;
  final VoidCallback suffixIconFunction;
  final bool showPassword;
  final dynamic maxLineNumber;

  const DefaultFormField(
      {Key ?key,
        required this.controller,
        required this.hintText,
        required  this.inputType,
        required  this.validatorFunction,
        required this.maxLineNumber,
        required   this.obscureValue,
        required   this.isPasswordTextField,
        required   this.showPassword,
        required   this.suffixIconFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextFormField(
        obscureText: obscureValue ? showPassword : false,
        controller: controller,
        maxLines: maxLineNumber ?? 1,
        keyboardType: inputType,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: suffixIconFunction,
                  icon: Icon(
                    showPassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: validatorFunction,
      ),
    );
  }
}
