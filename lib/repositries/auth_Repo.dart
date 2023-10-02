import 'package:flutter_restapi_with_mavvm/Data/network/baseApiServices.dart';
import 'package:flutter_restapi_with_mavvm/Data/network/networkApiServices.dart';
import 'package:flutter_restapi_with_mavvm/res/appUrls/app_Urls.dart';

class AuthRepository {
  BaseApiServices networkApiService = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await networkApiService.getPostResponse(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> signUpApi(dynamic data)async{
  try{
    dynamic response=await networkApiService.getPostResponse(AppUrls.registerUrl,data);
    return response;
  }catch(e){
    rethrow;
  }
}
}
