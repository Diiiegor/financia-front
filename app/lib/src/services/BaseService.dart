import 'package:get/get_connect.dart';
import 'package:app/src/services/LogoutService.dart';

class Baseservice extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:8000/api';
    httpClient.defaultContentType = "application/json";

    httpClient.addResponseModifier((request, response) {
      if(response.statusCode == 401){
        LogoutService.logout();
      }
      return response;
    });

    super.onInit();
  }



}
