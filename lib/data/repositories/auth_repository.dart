import 'package:dio/dio.dart';
import 'package:road_keeper_mobile/data/web_client.dart';

class AuthRepository with DioHandler {
  AuthRepository();

  Future<String> obtainToken(String login, String pass) async {
    var tokenDio = Dio();
    ///TODO insert your 'obtainToken' address
    var response = await execute(tokenDio.post("$kBaseUrl/api/login/",
        data: {'username': login, 'password': pass}));
    String token = response.data['token'];
    return token;
  }
}
