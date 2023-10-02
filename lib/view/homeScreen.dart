import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/Data/response/status.dart';
import 'package:flutter_restapi_with_mavvm/res/colors.dart';
import 'package:flutter_restapi_with_mavvm/utils/routes/routeNames.dart';
import 'package:flutter_restapi_with_mavvm/view_model/auth_View_Model.dart';

import 'package:flutter_restapi_with_mavvm/view_model/home_view_Model.dart';
import 'package:flutter_restapi_with_mavvm/view_model/user_view_Model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetchMoviesList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies List"),
          actions: [
            TextButton(
                onPressed: () {
                  final authprovider =
                      Provider.of<UserViewModel>(context, listen: false);
                  authprovider.remove();
                  Navigator.pushReplacementNamed(
                      context, RouteNames.loginScreen);
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: AppColors.whiteColor),
                ))
          ],
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => homeViewModel,
          child: Consumer<HomeViewModel>(builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()));
              case Status.COMPLETED:
                return Center(
                  child: ListView.builder(
                      itemCount: value.moviesList.data!.movies!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            subtitle: Text(value
                                .moviesList.data!.movies![index].year
                                .toString()),
                            leading: Image.network(
                              value.moviesList.data!.movies![index].posterurl
                                  .toString(),
                              errorBuilder: ((context, error, stackTrace) {
                                return const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                );
                              }),
                            ),
                            title: Text(value
                                .moviesList.data!.movies![index].title
                                .toString()),
                          ),
                        );
                      }),
                );
              default:
                return Container();
            }
          }),
        ));
  }
}
