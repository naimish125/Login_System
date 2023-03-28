import 'package:flutter/material.dart';
import 'package:loginsystem/Screen/provider/Splace_provider.dart';
import 'package:provider/provider.dart';

import 'Screen/provider/Signprovider.dart';
import 'Screen/view/Signin_Screen.dart';
import 'Screen/view/Signin_Secussful.dart';
import 'Screen/view/Signup_Screen.dart';
import 'Screen/view/onetimesplacescreen.dart';
import 'Screen/view/splash.dart';


Future<void> main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Signprovider(),
  ),
          ChangeNotifierProvider(
           create: (context) => IntroProvider(),
          ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
         // '/': (context) => SplashScreen(),
          '/': (context) => SignupPage(),
          'in': (context) => SignInPage(),
          'welcome': (context) => WelcomePage(),
        },
      ),
    ),
  );
}