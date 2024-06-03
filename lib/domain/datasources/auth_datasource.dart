abstract class AuthDatasource {
  Future<void> login();
  Future<void> register();
  Future<void> recoverPassword();
}
