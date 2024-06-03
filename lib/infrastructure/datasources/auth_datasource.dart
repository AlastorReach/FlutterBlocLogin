import 'package:dio/dio.dart';
import 'package:login_app/domain/datasources/auth_datasource.dart';
import 'package:login_app/infrastructure/http/dio_client.dart';
import 'package:login_app/infrastructure/http/token_manager.dart';

class AuthDatasourceImp extends AuthDatasource {
  final tokenManager = TokenManager();
  final dioClient = DioClient(
    BaseOptions(
      baseUrl: 'https://your-api.com',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ),
  );
  @override
  Future<void> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> recoverPassword() {
    // TODO: implement recoverPassword
    throw UnimplementedError();
  }

  @override
  Future<void> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
