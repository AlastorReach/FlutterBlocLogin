import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_event.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    on<CheckSession>(_onCheckSession);
  }

  void _onCheckSession(CheckSession event, Emitter<SessionState> emit) async {
    // Replace this with your actual session check logic
    bool isLoggedIn = await checkIfLoggedIn();
    if (isLoggedIn) {
      emit(SessionLoggedIn());
    } else {
      emit(SessionLoggedOut());
    }
  }

  Future<bool> checkIfLoggedIn() async {
    // Your logic to check if the user is logged in
    return false;
  }
}
