

import 'dart:io';
import 'dart:math';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/enums/enums.dart';

abstract class AuthenticationProviderUseCase{

  Future<void> loginUser();
  Future<void> registerUser();
  Future<void> logoutUser();
}

class AuthenticationProviderImpl extends ChangeNotifier implements AuthenticationProviderUseCase{
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailNameController = TextEditingController();
  final passwordController = TextEditingController();



final firebaseAuth = FirebaseAuth.instance;

viewState state = viewState.Idle;
String message = "";


  @override
  Future<void> loginUser() async{
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<void> logoutUser() async{
    return await firebaseAuth.signOut();
  }

  @override
  Future<void> registerUser() async{
    // TODO: implement registerUser
    viewState state = viewState.Busy;
    String message = " Creating your account";

    _updateState();

try{
  final result =await firebaseAuth.createUserWithEmailAndPassword(email: emailNameController.text.trim(), password: passwordController.text);

  result.user!.updateDisplayName(userNameController.text.trim());

  state = viewState.Success;
  message = 'Welcome, ${userNameController.text}';
  _updateState();


}on SocketException catch(_){
  state = viewState.Error;
  message = "Network error, please try again later";
  _updateState();
}on FirebaseAuthException catch (e){
  state = viewState.Error;
  message = e.code;
  _updateState();
}catch (e){
  state = viewState.Error;
  message = "Error creating account. Pleae try again later.";
  _updateState();
}

  }

  _updateState(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}