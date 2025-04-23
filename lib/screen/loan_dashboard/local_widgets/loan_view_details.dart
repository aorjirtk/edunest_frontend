import 'package:flutter/material.dart';
import 'package:my_flutter_app/config/extension.dart';
import 'package:my_flutter_app/styles/theme.dart';

class LoanViewDetails extends StatelessWidget {
  final String headerText;
  final String titleText;
  const LoanViewDetails({super.key, required this.headerText, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: AppTheme.headerStyle(),
        ),
        8.height(),
        Text(
          titleText,
          style: AppTheme.titleStyle(),
        ),
        15.height(),
      ],
    );
  }
}