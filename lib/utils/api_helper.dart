import 'dart:convert';
import 'package:api_app/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;
class ApiHelper  {
 Future<StatusModel?> apiToGet() async {
   String apiLink = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e28b470771a74c7b962d118b555d77c3";

   var response = await http.get(Uri.parse(apiLink));

   if (response.statusCode == 200) {
     var jsontostring = jsonDecode(response.body);
     StatusModel data = StatusModel.mapToModel(jsontostring);
     return data;
   }
   return null ;
 }
}
