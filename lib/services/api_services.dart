import 'package:http/http.dart';
//ip genymotion 10.0.3.2
class ApiServices {
  static String baseUrl = "http://10.0.3.2/rezkitravel/public/api/";
  static String login = baseUrl + "login";
  Client client = Client();
}