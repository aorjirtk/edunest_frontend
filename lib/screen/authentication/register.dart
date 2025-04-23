

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/config/extension.dart';
import 'package:my_flutter_app/directory/utils/app_logger.dart';
import 'package:my_flutter_app/directory/widgets/custom_button.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:my_flutter_app/styles/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register', style: AppTheme.headerStyle(),
              ),
              120.height(),
        
              CustomTextField(TextEditingController(),
              hint: 'FirstName',
              password: false,
              border: Border.all(color: greyColor),
              ),
              20.height(),

               CustomTextField(TextEditingController(),
              hint: 'LastName',
              password: false,
              border: Border.all(color: greyColor),
              ),
              20.height(),
                            
                            
              CustomTextField(TextEditingController(),
              hint: 'Username',
              password: false,
              border: Border.all(color: greyColor),
              ),
              20.height(),

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
                  appLogger("dhfielf");
                },
                text: 'Register',
              ),
              50.height(),
                  Text.rich(TextSpan(
                    children:[ 
                    TextSpan(text: 'Already have an account?  ', style: AppTheme.titleStyle(isBold: true)
                  ),
                  TextSpan(text: 'Sign in', style: AppTheme.titleStyle(isBold: true, Color: primaryColor),
                  recognizer: TapGestureRecognizer()..onTap = () {
                    context.go('/login_screen');// navigate to login screen
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