import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/models/usermodel.dart';
import 'package:flutter_restapi_with_mavvm/utils/routes/routeNames.dart';
import 'package:flutter_restapi_with_mavvm/utils/utils/utils.dart';
import 'package:flutter_restapi_with_mavvm/view_model/user_view_Model.dart';

class SplashServices {
  Future<UserModel> getuserData() => UserViewModel().getUser();
  void userAuthentication(BuildContext context) {
    getuserData().then((value) {
      if (value.token == 'null' || value.token == '') {
        Navigator.pushNamed(context, RouteNames.loginScreen);
      } else {
        Navigator.pushNamed(context, RouteNames.homeScreen);
      }
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}
