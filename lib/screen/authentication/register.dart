

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_text_form_field/flutter_text_form_field.dart';
import 'package:flutter_utilities/flutter_utilities.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/config/extension.dart';
import 'package:my_flutter_app/directory/utils/app_logger.dart';
import 'package:my_flutter_app/directory/utils/message.dart';
import 'package:my_flutter_app/directory/widgets/busy_overlay.dart';
import 'package:my_flutter_app/directory/widgets/custom_button.dart';
import 'package:my_flutter_app/enums/enums.dart';
import 'package:my_flutter_app/provider/authentication/auth_provider.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:my_flutter_app/styles/theme.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProviderImpl>(
      builder: (context, stateModel, _) {
  
        return BusyOverlay(

          show: stateModel.state == viewState.Busy,
          title: stateModel.message,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Register', style: AppTheme.headerStyle(),
                      ),
                      120.height(),
                                
                      CustomTextField(stateModel.firstNameController,
                      hint: 'FirstName',
                      password: false,
                      border: Border.all(color: greyColor),
                      ),
                      20.height(),
                            
                       CustomTextField(stateModel.lastNameController,
                      hint: 'LastName',
                      password: false,
                      border: Border.all(color: greyColor),
                      ),
                      20.height(),
                                    
                                    
                      CustomTextField(stateModel.userNameController,
                      hint: 'Username',
                      password: false,
                      border: Border.all(color: greyColor),
                      ),
                      20.height(),
                            
                      CustomTextField(stateModel.emailNameController,
                      hint: 'Email',
                      password: false,
                      border: Border.all(color: greyColor),
                      ),
                      20.height(),
                            
                            
                      CustomTextField(stateModel.passwordController,
                      hint: 'Password',
                      border: Border.all(color: greyColor),
                      ),
                      50.height(),
                            
                      CustomButton(
                        onPressed: () async{
                          if(stateModel.userNameController.text.isEmpty || 
                          stateModel.passwordController.text.isEmpty || 
                          stateModel.emailNameController.text.isEmpty || 
                          stateModel.firstNameController.text.isEmpty || 
                          stateModel.lastNameController.text.isEmpty){
                          showMessage(context, 'All fields are required', isError: true);
                          return; 
                          }
                  
                          if(!FlutterUtilities().isEmailValid(stateModel.emailNameController.text.trim())){
                            showMessage(context, "Invalid email provided", isError: true);
                            return;
                          }

                          await stateModel.registerUser();

                          if(stateModel.state == viewState.Error && context.mounted){
                            showMessage(context, stateModel.message);
                            return;
                          }

                              if(stateModel.state == viewState.Success && context.mounted){
                            showMessage(context, stateModel.message);
                            context.go('/add_loan');
                          }
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
                            context.go('/login');// navigate to login screen
                          }
                          ),
                          
                            
                            
                          ]
                          )
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}