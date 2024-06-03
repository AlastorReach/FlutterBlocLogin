import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/domain/datasources/auth_datasource.dart';
import 'package:login_app/domain/models/login_body.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_bloc.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_event.dart';
import 'package:login_app/infrastructure/datasources/auth_datasource.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final SessionBloc sessionBloc;
  late final AuthDatasource authDatasource;
  LoginBloc(SessionBloc sessionB) : super(LoginInitial()) {
    sessionBloc = sessionB;
    authDatasource = AuthDatasourceImp();
    on<LoginButtonPressed>(_handleLogin);
  }

  void _handleLogin(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginButtonPressed) {
      emit(LoginLoading());

      try {
        // Simulate a login process (e.g., make an API call)
        final response = await authDatasource.login(
            LoginBody(username: event.username, password: event.password));

        emit(LoginSuccess());
        sessionBloc.add(SetSession(token: response.data['token']));
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    }
  }
}
