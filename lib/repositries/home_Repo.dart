import 'package:flutter_restapi_with_mavvm/models/moviesModel.dart';

import '../Data/network/baseApiServices.dart';
import '../Data/network/networkApiServices.dart';
import '../res/appUrls/app_Urls.dart';

class HomeRepository {
  
  BaseApiServices networkApiService = NetworkApiService();
  Future<MoviesModel> getMoviewList() async {
    try {
      dynamic response =
          await networkApiService.getResponse(AppUrls.moviesList);
      return response=MoviesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
