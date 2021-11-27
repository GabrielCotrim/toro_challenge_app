part of 'response_bloc.dart';

abstract class ResponseState extends Equatable {
  const ResponseState();

  @override
  List<Object> get props => [];
}

class Empty extends ResponseState {}

class Loading extends ResponseState {}

class Loaded<T> extends ResponseState {
  final T response;

  const Loaded({required this.response});
}

class Error extends ResponseState {
  final String message;

  const Error({required this.message});
}