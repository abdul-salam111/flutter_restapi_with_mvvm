import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/Data/response/response.dart';
import 'package:flutter_restapi_with_mavvm/models/moviesModel.dart';
import 'package:flutter_restapi_with_mavvm/repositries/home_Repo.dart';
import 'package:flutter_restapi_with_mavvm/utils/utils/utils.dart';

class HomeViewModel with ChangeNotifier {
  final myhomerepo = HomeRepository();
  ApiResponse<MoviesModel> moviesList = ApiResponse.loading();
  setMoviesList(ApiResponse<MoviesModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesList(BuildContext context) async {
    setMoviesList(ApiResponse.loading());
    myhomerepo.getMoviewList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
