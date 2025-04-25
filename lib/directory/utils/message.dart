

import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/styles/theme.dart';
import 'package:toastification/toastification.dart';

void showMessage(BuildContext context, String message, {bool isError = false}){
  toastification.show(
    context:context,
    title: Text(
      message,
      style: AppTheme.headerStyle(),
    ),
    showProgressBar: true,
    autoCloseDuration: const Duration(seconds: 3),
    type: isError? ToastificationType.error: ToastificationType.success,

    animationDuration: const Duration(milliseconds:300),
    animationBuilder:(context, animation, alignment, child){
      return RotationTransition(
        turns: animation,
      child: child,
      );
      }
    );
}