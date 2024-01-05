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
    context.read<HomeProvider>().getData();
  }

  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Country News"),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildActionChip(name: "USA", countryCode: 'us'),
                  buildActionChip(name: "INDIA", countryCode: 'in'),
                  buildActionChip(name: "CANADA", countryCode: 'ca'),
                  buildActionChip(name: "AUS", countryCode: 'au'),
                ],
              ),
              providerw!.statusModel == null
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: providerw!.statusModel!.articalList!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                leading: Image.network(providerw!.statusModel!
                                        .articalList![index].urlToImage ??
                                    "https://yt3.googleusercontent.com/y_esGAQOhX4rTpWvrALErAJlFbm_2TIVrvcVfcZny7TuA8dJZgOQcC6KRfd_J5hljFe-foYXj9U=s900-c-k-c0x00ffffff-no-rj"),
                                title: Text(
                                  "${providerw!.statusModel!.articalList![index].title}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, 'tesla');
                                },
                              ));
                        },
                      ),
                    ),
            ],
          )),
    );
  }

  ActionChip buildActionChip(
          {required String name, required String countryCode}) =>
      ActionChip(
        label: Text(name),
        backgroundColor: providerr!.selectedCountry == countryCode?Colors.blue:Colors.white,
        onPressed: () {
          providerr!.Country(countryCode);
          providerr!.getData();
        },
      );
}

/*
*     Text("${providerw!.statusModel!.articalList![index].publishedAt}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          const SizedBox(height: 10,),
                          Text("===>   ${providerw!.statusModel!.articalList![index].description}"),
                          const SizedBox(height: 5,),
                          Text("===>   ${providerw!.statusModel!.articalList![index].content}"),*/
