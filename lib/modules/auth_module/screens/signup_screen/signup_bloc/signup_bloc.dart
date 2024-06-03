import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/modules/auth_module/screens/signup_screen/signup_bloc/signup_event.dart';
import 'package:login_app/modules/auth_module/screens/signup_screen/signup_bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  Stream<SignUpState> mapEventToState(SignupEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();

      try {
        // Simulate a login process (e.g., make an API call)
        await Future.delayed(Duration(seconds: 2));

        // Assume login is successful
        yield SignUpSuccess();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
