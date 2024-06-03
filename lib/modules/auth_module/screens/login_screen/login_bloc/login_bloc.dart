import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        // Simulate a login process (e.g., make an API call)
        await Future.delayed(Duration(seconds: 2));

        // Assume login is successful
        yield LoginSuccess();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}