import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/repositries/auth_Repo.dart';
import 'package:flutter_restapi_with_mavvm/utils/routes/routeNames.dart';
import 'package:flutter_restapi_with_mavvm/utils/utils/utils.dart';
import 'package:flutter_restapi_with_mavvm/view_model/user_view_Model.dart';
import 'package:provider/provider.dart';

import '../models/usermodel.dart';

class AuthViewModel with ChangeNotifier{
  bool _loading=false;
  bool get loading=>_loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
  final myrepo=AuthRepository();
  Future<void> loginApi(dynamic data,BuildContext context)async{
    setLoading(true);
    myrepo.loginApi(data).then((value){
      final userPreference = Provider.of<UserViewModel>(context , listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString()
        )
      );

      Navigator.pushNamed(context,RouteNames.homeScreen);
       setLoading(false);
    Utils.flushBarErrorMessage(value.toString(), context);
    }).onError((error, stackTrace){
       setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);

    });
   

  }
   Future<void> signUpApi(dynamic data,BuildContext context)async{
     setLoading(true);
    myrepo.signUpApi(data).then((value){
      Navigator.pushNamed(context,RouteNames.homeScreen);
       setLoading(false);
    Utils.flushBarErrorMessage(value.toString(), context);
    }).onError((error, stackTrace){
       setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}