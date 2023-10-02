import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/utils/routes/routeNames.dart';
import 'package:flutter_restapi_with_mavvm/utils/routes/routes.dart';
import 'package:flutter_restapi_with_mavvm/view/loginScreen.dart';
import 'package:flutter_restapi_with_mavvm/view_model/auth_View_Model.dart';
import 'package:flutter_restapi_with_mavvm/view_model/home_view_Model.dart';
import 'package:flutter_restapi_with_mavvm/view_model/user_view_Model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
