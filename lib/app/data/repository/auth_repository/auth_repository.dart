

abstract class AuthRepository {
  Future<dynamic> userRegistration(queryParams);
  Future<dynamic> userLogin(queryParams);
}
