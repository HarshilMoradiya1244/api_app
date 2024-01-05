import 'dart:convert';
import 'package:api_app/screen/home/model/home_model.dart';
import 'package:api_app/screen/tesla/model/tesla_model.dart';
import 'package:http/http.dart' as http;
class ApiHelper  {
 Future<StatusModel?> newsApi(String country) async {
   String apiLink = "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=e28b470771a74c7b962d118b555d77c3";

   var response = await http.get(Uri.parse(apiLink));

   if (response.statusCode == 200) {
     var jsontostring = jsonDecode(response.body);
     StatusModel data = StatusModel.mapToModel(jsontostring);
     return data;
   }
   return null ;
 }

 Future<TeslaModel?> teslaApi() async {
   String apiLink = "https://newsapi.org/v2/everything?q=tesla&from=2023-12-05&sortBy=publishedAt&apiKey=e28b470771a74c7b962d118b555d77c3";

   var response = await http.get(Uri.parse(apiLink));

   if (response.statusCode == 200) {
     var jsontostring = jsonDecode(response.body);
     TeslaModel data = TeslaModel.mapToModel(jsontostring);
     return data;
   }
   return null ;
 }

}
