import 'package:dio/dio.dart';
import 'token_manager.dart';

class ResponseInterceptor extends Interceptor {
  final TokenManager tokenManager;

  ResponseInterceptor(this.tokenManager);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the access token to the request headers if available
    final accessToken = await tokenManager.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    // Check if the error is due to token expiration
    if (err.response?.statusCode == 401) {
      // Attempt to refresh the token
      final refreshToken = await tokenManager.getRefreshToken();
      if (refreshToken != null) {
        try {
          final response = await Dio().post(
            'https://your-api.com/refresh',
            data: {'refresh_token': refreshToken},
          );

          // Save the new tokens
          final newAccessToken = response.data['access_token'];
          final newRefreshToken = response.data['refresh_token'];
          await tokenManager.saveTokens(newAccessToken, newRefreshToken);

          // Retry the failed request with the new access token
          final options = err.requestOptions;
          options.headers['Authorization'] = 'Bearer $newAccessToken';
          final cloneReq = await Dio().fetch(options);
          return handler.resolve(cloneReq);
        } catch (e) {
          // Refresh token failed, clear stored tokens and log out the user
          await tokenManager.clearTokens();
        }
      }
    }
    handler.next(err);
  }
}
