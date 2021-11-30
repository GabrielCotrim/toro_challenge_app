import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toro_challenge/core/error/failures.dart';

part 'response_state.dart';

abstract class ResponseBloc<T> extends Bloc<T, ResponseState> {
  ResponseBloc(ResponseState initialState) : super(initialState);
}

String mapFailureToMessage(Failure failure) {
  return failure.message;
}
