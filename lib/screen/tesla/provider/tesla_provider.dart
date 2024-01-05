import 'package:flutter/material.dart';
import '../../../utils/api_helper.dart';
import '../model/tesla_model.dart';

class TeslaNewsProvider with ChangeNotifier{

  TeslaModel? teslaModel ;

  Future<void> getData()
  async {
    ApiHelper apiHelper = ApiHelper();
    TeslaModel? user = await apiHelper.teslaApi();
    teslaModel = user;
    notifyListeners();
  }
}
