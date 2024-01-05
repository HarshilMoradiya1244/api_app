import 'package:api_app/screen/home/view/home_screen.dart';
import 'package:api_app/screen/splash/view/splash_screen.dart';
import 'package:api_app/screen/tesla/view/tesla_news_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes = {
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'tesla':(context) => const TeslaNewsScreen(),
};