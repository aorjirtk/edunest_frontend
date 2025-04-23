


import 'package:flutter/material.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:my_flutter_app/styles/theme.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? width;
  const CustomButton({super.key, required this.onPressed, this.text = 'Continue', this.width});

  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: onPressed,
    style: ButtonStyle(
      fixedSize: WidgetStateProperty.resolveWith((states)=> Size(width ?? MediaQuery.of(context).size.width,0)),
      backgroundColor: WidgetStateProperty.resolveWith((states)=>primaryColor)
    ),
     child: Text(text, style: AppTheme.titleStyle(Color: whiteColor),));
  }
}