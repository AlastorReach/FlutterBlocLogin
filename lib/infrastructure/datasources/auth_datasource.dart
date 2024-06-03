import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:login_app/domain/datasources/auth_datasource.dart';
import 'package:login_app/domain/models/login_body.dart';
import 'package:login_app/domain/models/signup_body.dart';
import 'package:login_app/infrastructure/constants/env.dart';
import 'package:login_app/infrastructure/http/dio_client.dart';

class AuthDatasourceImp extends AuthDatasource {
  late final DioClient dio;
  AuthDatasourceImp() {
    String baseUrl = dotenv.env[LOGIN_API_BASE_URL] ?? "";
    dio = DioClient(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      ),
    );
  }

  @override
  Future<Response<dynamic>> login(LoginBody body) async {
    return await dio.client.post('/api/auth/login', data: body.toJson());
  }

  @override
  Future<Response<dynamic>> recoverPassword() async {
    return await dio.client.post('/recover-password');
  }

  @override
  Future<Response<dynamic>> register(SignUpBody body) async {
    return await dio.client.post('/api/auth/signup', data: body);
  }
}
