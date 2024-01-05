import 'package:api_app/screen/mobile/model/mobile_news_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/api_helper.dart';

class MobileProvider with ChangeNotifier{

  MobileModel? mobileModel ;
  String selectedMobile = "apple";

  void mobile(String country){
    selectedMobile= country;
    notifyListeners();
  }

  Future<void> getData()
  async {
    ApiHelper apiHelper = ApiHelper();
    MobileModel? user = await apiHelper.mobileApi(selectedMobile);
    mobileModel = user;
    notifyListeners();
  }

}
