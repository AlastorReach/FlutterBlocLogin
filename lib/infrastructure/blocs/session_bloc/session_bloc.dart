import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_event.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_state.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    on<CheckSession>(_onCheckSession);
    on<SetSession>(_onSetSession);
  }

  void _onCheckSession(CheckSession event, Emitter<SessionState> emit) async {
    bool isLoggedIn = await checkIfLoggedIn();
    if (isLoggedIn) {
      emit(SessionLoggedIn());
    } else {
      emit(SessionLoggedOut());
    }
    FlutterNativeSplash.remove();
  }

  Future<bool> checkIfLoggedIn() async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if (token != null) {
      final isExpired = JwtDecoder.isExpired(token);
      return isExpired;
    }
    return false;
  }

  void _onSetSession(SetSession event, Emitter<SessionState> emit) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: event.token);
    emit(SessionLoggedIn());
  }
}
