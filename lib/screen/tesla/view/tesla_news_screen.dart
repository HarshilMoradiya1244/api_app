import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tesla_provider.dart';

class TeslaNewsScreen extends StatefulWidget {
  const TeslaNewsScreen({super.key});

  @override
  State<TeslaNewsScreen> createState() => _TeslaNewsScreenState();
}

class _TeslaNewsScreenState extends State<TeslaNewsScreen> {
  @override
  TeslaNewsProvider? providerr;
  TeslaNewsProvider? providerw;
  TextEditingController txtCar = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<TeslaNewsProvider>().getData();
  }

  Widget build(BuildContext context) {
    providerr = context.read<TeslaNewsProvider>();
    providerw = context.watch<TeslaNewsProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Car News"),
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
                  providerr!.car(txtCar.text);
                  providerr!.getData();
                },
              ),
              SizedBox(
                height: 10,
              ),
              providerw!.teslaModel == null
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: providerw!.teslaModel!.articalList!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              leading: Image.network(providerw!.teslaModel!
                                      .articalList![index].urlToImage ??
                                  "https://yt3.googleusercontent.com/y_esGAQOhX4rTpWvrALErAJlFbm_2TIVrvcVfcZny7TuA8dJZgOQcC6KRfd_J5hljFe-foYXj9U=s900-c-k-c0x00ffffff-no-rj"),
                              title: Text(
                                "${providerw!.teslaModel!.articalList![index].title}",
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
