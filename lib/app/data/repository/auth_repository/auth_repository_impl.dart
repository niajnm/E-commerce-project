import 'package:e_commerce/app/data/remote/remote-auth/auth_remote_source.dart';
import 'package:e_commerce/app/data/repository/auth_repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  AuthRepositoryImpl(this._remoteSource);


  @override
  Future<dynamic> userLogin(queryParams) {
   return _remoteSource.userLogin(queryParams);
  }
  
  @override
  Future userRegistration(queryParams) {
     return _remoteSource.userRegistration(queryParams);
  }
}
