import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/view_model/services/splashServices.dart';
import 'package:flutter_restapi_with_mavvm/res/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.userAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: 
      Center(child: Text("SplashScreen",style: TextStyle(color: AppColors.blackColor),),)
    );
  }
}
