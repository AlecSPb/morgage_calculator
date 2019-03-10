import 'package:road_keeper_mobile/data/repositories/auth_repository.dart';
import 'package:road_keeper_mobile/data/shared_pref_repository.dart';

class Injector {
  static final Injector _instance = Injector._internal();

  factory Injector() => _instance;

  Injector._internal();

  final SharedPrefRepository _sharedPrefRepository =
      SharedPrefRepositoryDefault();
  final AuthRepository _authRepository = AuthRepository();

  SharedPrefRepository get sharedPrefRepository => _sharedPrefRepository;
  AuthRepository get authRepository => _authRepository;

}
