import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:travel_booking/models/hive/auth.dart';
import 'package:travel_booking/models/login_model.dart';
import 'package:travel_booking/services/api_services.dart';

class LoginProvider with ChangeNotifier {
  var api = ApiServices();

  LoginModel login;

  Future<void> getLoginProvider(String email, String password) async {
    Response response;
    Dio dio = new Dio();
    try {
      response = await dio.post(ApiServices.login,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }),
          data: {
            "email": email,
            "password": password,
          });
      // print(response.data.toString());
      if (response.statusCode == 200) {
      notifyListeners();
      var res = LoginModel.fromJson(response.data);
      login = res;
      return res;
      } else {
        return null;
      }

    } on DioError catch (e) {
      print(e.message);
    }
  }
}
