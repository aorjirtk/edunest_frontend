


import 'package:go_router/go_router.dart';
import 'package:my_flutter_app/screen/authentication/login.dart';
import 'package:my_flutter_app/screen/authentication/register.dart';
import 'package:my_flutter_app/screen/authentication/splash_screen.dart';
import 'package:my_flutter_app/screen/loan_dashboard/add_loan/add_loan_screen.dart';
import 'package:my_flutter_app/screen/loan_dashboard/loan_dashboard_screen.dart';
import 'package:my_flutter_app/screen/loan_dashboard/search_loan/search_loan_screen.dart';
import 'package:my_flutter_app/screen/loan_dashboard/view_loan/view_loan_screen.dart';
// import 'package:my_flutter_app/screen/laon_dashboard/student_loan_app.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [


    GoRoute(path: '/', 
        builder: (context, state) =>  const SplashScreen(),
    ),



        GoRoute(path: '/register', 
        builder: (context, state) =>  const RegisterScreen(),


    ),
          GoRoute(path: '/login', 
          builder: (context, state) =>  const LoginScreen(),



    ),
           GoRoute(path: '/loan_dashboard', 
           builder: (context, state) =>  const LoanDashboardScreen(),


    ),
    //    GoRoute(path: '/student_loan', builder: (context, state) =>  const StudentLoanApp(),
    // ),
             GoRoute(path: '/add_loan', 
             builder: (context, state) =>  const AddLoanScreen(),



    ),
            GoRoute(path: '/view_loan', 
            builder: (context, state) =>  const ViewLoanScreen(),


    ),
            GoRoute(path: '/search_loan', 
            builder: (context, state) =>  const SearchLoanScreen(),
    ),
   
  ]
);