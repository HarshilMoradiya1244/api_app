import 'package:api_app/screen/mobile/provider/mobile_news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileNewsScreen extends StatefulWidget {
  const MobileNewsScreen({super.key});

  @override
  State<MobileNewsScreen> createState() => _MobileNewsScreenState();
}

class _MobileNewsScreenState extends State<MobileNewsScreen> {
  MobileProvider? providerr;
  MobileProvider? providerw;
  TextEditingController txtCar = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MobileProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    providerr = context.read<MobileProvider>();
    providerw = context.watch<MobileProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Mobile News"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SearchBar(
                controller: txtCar,
                leading: Icon(Icons.search_rounded),
                hintText: 'Search The News',
                onSubmitted: (value) {
                  providerr!.mobile(txtCar.text);
                  providerr!.getData();
                },
              ),
              SizedBox(
                height: 10,
              ),
              providerw!.mobileModel == null
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: providerw!.mobileModel!.articalList!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              leading: Image.network(providerw!.mobileModel!
                                      .articalList![index].urlToImage ??
                                  "https://yt3.googleusercontent.com/y_esGAQOhX4rTpWvrALErAJlFbm_2TIVrvcVfcZny7TuA8dJZgOQcC6KRfd_J5hljFe-foYXj9U=s900-c-k-c0x00ffffff-no-rj"),
                              title: Text(
                                "${providerw!.mobileModel!.articalList![index].title}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
