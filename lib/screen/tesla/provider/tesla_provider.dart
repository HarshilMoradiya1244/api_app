import 'package:flutter/material.dart';
import '../../../utils/api_helper.dart';
import '../model/tesla_model.dart';

class TeslaNewsProvider with ChangeNotifier{

  TeslaModel? teslaModel ;
  String selectedCar = "tesla";

  void car(String car){
    selectedCar= car;
    notifyListeners();
  }
  Future<void> getData()
  async {
    ApiHelper apiHelper = ApiHelper();
    TeslaModel? user = await apiHelper.teslaApi(selectedCar);
    teslaModel = user;
    notifyListeners();
  }
}
