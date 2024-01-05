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
          title: const Text("Country News"),
        ),
        body: providerw!.teslaModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: providerw!.teslaModel!.articalList!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.8,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    Image.network(providerw!
                        .teslaModel!.articalList![index].urlToImage ??
                        "https://yt3.googleusercontent.com/y_esGAQOhX4rTpWvrALErAJlFbm_2TIVrvcVfcZny7TuA8dJZgOQcC6KRfd_J5hljFe-foYXj9U=s900-c-k-c0x00ffffff-no-rj"),
                    const SizedBox(height: 10,),
                    Text("${providerw!.teslaModel!.articalList![index].title}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    const SizedBox(height: 10,),
                    Text("${providerw!.teslaModel!.articalList![index].publishedAt}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    const SizedBox(height: 10,),
                    Text("===>   ${providerw!.teslaModel!.articalList![index].description}"),
                    const SizedBox(height: 5,),
                    Text("===>   ${providerw!.teslaModel!.articalList![index].content}"),
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
