import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:road_keeper_mobile/data/repositories/auth_repository.dart';
import 'package:road_keeper_mobile/data/shared_pref_repository.dart';
import 'package:road_keeper_mobile/utils/errors.dart';
///TODO insert your webService address
final String kBaseUrl = "http://roadupkeep.ptmobile.ru";

class WebClient {
  String _kJwtHeader = "ROADSUPKEEP_JWT";
  int _kConnectTimeOut = 5000;
  int _kReceiveTimeOut = 3000;
  String get baseUrl => kBaseUrl;
  //final HttpClient client;
  final Dio dio = Dio();
  GraphQLdioClient _graphClient;

  final SharedPrefRepository _sharedPrefRepository;
  final AuthRepository _authRepository;

  String _token(String token) {
    return "$_kJwtHeader=$token";
  }

  WebClient(this._sharedPrefRepository, this._authRepository) {
    _graphClient = GraphQLdioClient(dio, "/api/graphql/");
    var options = Options(
        baseUrl: kBaseUrl,
        connectTimeout: _kConnectTimeOut,
        receiveTimeout: _kReceiveTimeOut);
    dio.options = options;

    dio.interceptor.request.onSend = (Options options) async {
      var token = await _sharedPrefRepository.getToken();
      if (token == null) {
        var userCreds = await _sharedPrefRepository.getUserCreds();
        dio.lock();
        try {
          token = await _authRepository.obtainToken(
              userCreds.login, userCreds.passWord);
          await _sharedPrefRepository.saveToken(token);
        } on DioError catch (e) {
          throw e;
        } finally {
          dio.unlock();
        }
      }
      options.headers["cookie"] = _token(token);
      print("""
      REQUEST ${options.method}: ${options.baseUrl}${options.path}
      -data ${options.data}
      """);
      return options;
    };

    dio.interceptor.response.onSuccess = (Response response) {
      print("""
      RESPONSE ${response.request.method}: ${response.request.baseUrl}${response.request.path}
      -data ${response.data}
      """);
    };

    dio.interceptor.response.onError = (DioError e) {
      print("""
      API ERROR
      -request: ${e.response?.request?.method}=>${e.response?.request?.baseUrl} ${e.response?.request?.path}
      -response: ${e.response}
      """);
      return e;
    };
  }

  Future<Response<T>> query<T>(
    String query,
    Map<String, dynamic> variables,
  ) =>
      _graphClient.query(query, variables);
}

class GraphQLdioClient {
  final Dio _client;
  final String _apiPath;
  GraphQLdioClient(this._client, this._apiPath);

  Future<Response<T>> query<T>(
    String query,
    Map<String, dynamic> variables,
  ) {
    final String body = _encodeBody(
        query.replaceAll('\n', ' '),
        variables: variables);
    return _client.post(
      _apiPath,
      data: body,
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );
  }

  String _encodeBody(
    String query, {
    Map<String, dynamic> variables,
  }) {
    return json.encode({
      'query': query,
      'variables': variables,
    });
  }
}

Exception _parseException(DioError e) {
  var resultError;
  switch (e.type) {
    case (DioErrorType.RESPONSE):
      resultError = ApiException(message: e.message);
      break;
    default:
      resultError = ConnectException();
  }
  return resultError;
}

mixin DioHandler {
  Future<Response<T>> execute<T>(Future<Response<T>> request) async {
    try {
      return await request;
    } on DioError catch (e) {
      throw (_parseException(e));
    }
  }
}
