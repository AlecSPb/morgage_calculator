import 'package:shared_preferences/shared_preferences.dart';

const String _kToken = "token";
const String _kExt = "_ext";
const String _kLogin = "_login";
const String _kPassword = "_password";

abstract class SharedPrefRepository {
  Future<bool> saveToken(String token, {String login, String password});
  Future<String> getToken();
  Future<bool> cleanPrefs();
  Future<UserCreds> getUserCreds();
}

class SharedPrefRepositoryDefault implements SharedPrefRepository {
  SharedPrefRepositoryDefault();

  @override
  Future<bool> cleanPrefs() async {
    var prefs = SharedPreferences.getInstance();
    return await prefs.then((s) => s.clear());
  }

  @override
  Future<String> getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(_kToken);
  }

  @override
  Future<UserCreds> getUserCreds() async {
    var prefs = await SharedPreferences.getInstance();
    return UserCreds(
      prefs.getString(_kLogin),
      prefs.getString(_kPassword),
    );
  }

  @override
  Future<bool> saveToken(String token, {String login, String password}) async {
    var prefs = await SharedPreferences.getInstance();
    var operation = [prefs.setString(_kToken, token)];
    if (login != null) operation.add(prefs.setString(_kLogin, login));
    if (password != null) operation.add(prefs.setString(_kPassword, password));
    await Future.wait(operation);
    return true;
  }
}

class MockSharedPrefRepository implements SharedPrefRepository {
  final String token;
  final UserCreds userCreds;
  MockSharedPrefRepository(this.token,
      {this.userCreds = const UserCreds("admin", "1234qwer")});

  @override
  Future<bool> cleanPrefs() async{
    return true;
  }

  @override
  Future<String> getToken() async{
    return token;
  }

  @override
  Future<UserCreds> getUserCreds() async {
    return userCreds;
  }

  @override
  Future<bool> saveToken(String token, {String login, String password}) async{
    return true;
  }
}

class UserCreds {
  final String login;
  final String passWord;
  const UserCreds(this.login, this.passWord);
}
