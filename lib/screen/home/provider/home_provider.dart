import 'package:api_app/screen/home/model/home_model.dart';
import 'package:api_app/utils/api_helper.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier{

  StatusModel? statusModel ;

  Future<void> getData()
  async {
    ApiHelper apiHelper = ApiHelper();
    StatusModel? user = await apiHelper.apiToGet();
    statusModel = user;
    notifyListeners();
  }
}
