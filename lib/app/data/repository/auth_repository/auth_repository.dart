abstract class AuthRepository {
  Future<dynamic> userRegistration(queryParams);
  Future<dynamic> userLogin(queryParams);
  Future<dynamic> updateProfile(queryParams);
}
