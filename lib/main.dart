import 'package:flutter/material.dart';
import 'package:my_flutter_app/config/router_config.dart';
import 'package:my_flutter_app/styles/colors.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(option: DefaultFirebaseOptions.currentPlatform);

  runApp (const MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true, scrolledUnderElevation: 0, backgroundColor: Colors.transparent),

        scaffoldBackgroundColor: whiteColor,
        primaryColor: primaryColor,
      ),
      
    );
  }
}
  
