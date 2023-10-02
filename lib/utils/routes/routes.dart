import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/utils/routes/routeNames.dart';
import 'package:flutter_restapi_with_mavvm/view/homeScreen.dart';
import 'package:flutter_restapi_with_mavvm/view/loginScreen.dart';
import 'package:flutter_restapi_with_mavvm/view/signUpScreen.dart';
import 'package:flutter_restapi_with_mavvm/view/splashScreen.dart';

class Routes {
  static Route<dynamic>  generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen(),);
       case RouteNames.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView(),);
      case RouteNames.signUpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView(),);
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen(),);
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(child: Text("No route defined")),
                ));
    }
  }
}
