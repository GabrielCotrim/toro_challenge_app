part of 'user_position_bloc.dart';

abstract class UserPositionState extends Equatable {
  const UserPositionState();
  
  @override
  List<Object> get props => [];
}

class Empty extends UserPositionState {}

class Loading extends UserPositionState {}

class Loaded extends UserPositionState {
  final UserPosition userPosition;

  const Loaded({required this.userPosition});
}

class Error extends UserPositionState {
  final String message;

  const Error({required this.message});
}