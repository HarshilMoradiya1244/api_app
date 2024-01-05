import 'package:api_app/screen/dash/provider/dash_provider.dart';
import 'package:api_app/screen/mobile/view/mobile_news_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/view/home_screen.dart';
import '../../tesla/view/tesla_news_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashPrrovider? providerr;
  DashPrrovider? providerw;

  List<Widget> screen =[
    const HomeScreen(),
    const TeslaNewsScreen(),
    const MobileNewsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    providerr = context.read<DashPrrovider>();
    providerw = context.watch<DashPrrovider>();

    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: providerw!.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card),
                label: "HeadLines News",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.car_rental), label: 'Car News'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mobile_friendly), label: 'Mobile News'),
            ],
            onTap: (value) {
              int i = value;
              providerr!.changeIndex(i);
            },
          ),
          body:screen[providerr!.currentIndex],
        ),
      ),
    );
  }
}
