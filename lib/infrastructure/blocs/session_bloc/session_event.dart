import 'package:equatable/equatable.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class CheckSession extends SessionEvent {}

class SetSession extends SessionEvent {
  final String token;

  const SetSession({required this.token});
}
