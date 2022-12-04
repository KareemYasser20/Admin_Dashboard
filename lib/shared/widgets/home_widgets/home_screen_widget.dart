import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color iconColor;
  final VoidCallback  onTapFunction;

   const HomeWidget(
    {
      Key? key,
      required this.icon,
      required this.text,
      required this.iconColor,
      required this.onTapFunction
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(
                icon,
                size: 80.0,
                color: iconColor,
              ),
              const SizedBox(
                 height: 10.0,
              ),
              Text(
                text,
                style:const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
