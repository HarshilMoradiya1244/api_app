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
          title: const Text("Country News"),
        ),
        body: providerw!.statusModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: providerw!.statusModel!.articalList!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Image.network(providerw!
                                  .statusModel!.articalList![index].urlToImage ??
                              "https://yt3.googleusercontent.com/y_esGAQOhX4rTpWvrALErAJlFbm_2TIVrvcVfcZny7TuA8dJZgOQcC6KRfd_J5hljFe-foYXj9U=s900-c-k-c0x00ffffff-no-rj+"),
                          Text("${providerw!.statusModel!.articalList![index].title}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          const SizedBox(height: 10,),
                          Text("${providerw!.statusModel!.articalList![index].publishedAt}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          const SizedBox(height: 10,),
                          Text("===>   ${providerw!.statusModel!.articalList![index].description}"),
                          const SizedBox(height: 5,),
                          Text("===>   ${providerw!.statusModel!.articalList![index].content}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
