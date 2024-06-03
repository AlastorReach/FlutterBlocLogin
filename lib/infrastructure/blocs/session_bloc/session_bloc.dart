import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_event.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    on<CheckSession>(_onCheckSession);
    on<SetSession>(_onSetSession);
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
    await Future.delayed(const Duration(milliseconds: 1000));
    return false;
  }

  void _onSetSession(SetSession event, Emitter<SessionState> emit) async {
    emit(SessionLoggedIn());
  }
}
