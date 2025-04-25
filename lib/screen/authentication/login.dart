


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/config/extension.dart';
import 'package:my_flutter_app/directory/widgets/custom_button.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:my_flutter_app/styles/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: AppTheme.headerStyle(),
              ),
              120.height(), 

              CustomTextField(TextEditingController(),
              hint: 'Email',
              password: false,
              border: Border.all(color: greyColor),
              ),
              20.height(),


              CustomTextField(TextEditingController(),
              hint: 'Password',
              border: Border.all(color: greyColor),
              ),
              50.height(),

              CustomButton(
                onPressed: (){
                  //  context.go('/loan_dashboard_screen');
                  context.go('/add_loan');
                  // context.go('/student_loan_app');
                },
                text: 'Login',
              ),
              50.height(),
                  Text.rich(TextSpan(
                    children:[ 
                    TextSpan(text: "Don't have an account?  ", style: AppTheme.titleStyle(isBold: true)
                  ),
                  TextSpan(text: 'Sign up', style: AppTheme.titleStyle(isBold: true, Color: primaryColor),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    // navigate to register screen
                    context.go('/register');
                  }
                  ),
                  
                  ]
                 )
              ),
            ],
          ),
        ),
      ),
    );
  }
}