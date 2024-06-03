import 'package:dio/dio.dart';
import 'package:login_app/domain/models/login_body.dart';
import 'package:login_app/domain/models/signup_body.dart';

abstract class AuthDatasource {
  Future<Response<dynamic>> login(LoginBody body);
  Future<void> register(SignUpBody body);
  Future<void> recoverPassword();
}
