import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/config/router_config.dart';
import 'package:my_flutter_app/firebase_options.dart';
import 'package:my_flutter_app/provider/authentication/auth_provider.dart';
import 'package:my_flutter_app/styles/colors.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp (const MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:  [
      ChangeNotifierProvider(create: (context) => AuthenticationProviderImpl()),
    ],
    child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true, scrolledUnderElevation: 0, backgroundColor: Colors.transparent),

        scaffoldBackgroundColor: whiteColor,
        primaryColor: primaryColor,
      ),
      
    ), 
    );
  }
}
  
