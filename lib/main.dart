import 'package:api_app/screen/home/provider/home_provider.dart';
import 'package:api_app/screen/tesla/provider/tesla_provider.dart';
import 'package:api_app/utils/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:  (context) => HomeProvider(),),
      ChangeNotifierProvider(create:  (context) => TeslaNewsProvider(),)
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  ));
}
