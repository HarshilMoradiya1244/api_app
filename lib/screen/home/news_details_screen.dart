import 'package:api_app/screen/home/model/home_model.dart';
import 'package:api_app/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;

  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    StatusModel l1 =ModalRoute.of(context)!.settings.arguments as StatusModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Head Lines"),
        ),
        body: Column(
          children: [
            providerw!.statusModel == null
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
              child: ListView.builder(
                itemCount: providerw!.statusModel!.articalList!.length,
                itemBuilder: (context, index) {
                  StatusModel dataList = providerw!.newsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      child:Column(
                        children: [
                          Image.network (providerw!.statusModel!
                              .articalList![index].urlToImage ??
                              "https://yt3.googleusercontent.com/y_esGAQOhX4rTpWvrALErAJlFbm_2TIVrvcVfcZny7TuA8dJZgOQcC6KRfd_J5hljFe-foYXj9U=s900-c-k-c0x00ffffff-no-rj"),
                          Text(
                            "${providerw!.statusModel!.articalList![index].title}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      )

                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
