import 'package:api_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>();
  }
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Country News"),
        ),
        body: Center(
          child: Column(
            children: [
              ListView.builder(
                itemCount: providerw!.statusModel!.articalList!.length,
                itemBuilder: (context, index) {
                ListTile(
                  title: Text("${providerw!.statusModel!.articalList![index].title}"),
                  subtitle: Text("${providerw!.statusModel!.articalList![index].author}")
                );
              },),
            ],
          ),
        ),
      ),
    );
  }
}
