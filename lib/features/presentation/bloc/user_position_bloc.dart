import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toro_challenge/core/usecases/use_case.dart';

import '../../../core/error/failures.dart';
import '../../domain/entities/user_position.dart';
import '../../domain/usecases/get_user_position.dart';

part 'user_position_event.dart';
part 'user_position_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Falha no servidor';

class UserPositionBloc extends Bloc<UserPositionEvent, UserPositionState> {
  final GetUserPosition getUserPosition;

  UserPositionState get initialState => Empty();

  UserPositionBloc({
    required this.getUserPosition,
  }) : super(Empty()) {
    on<GetUserPositionEvent>((event, emit) async {
      emit(Loading());
      final failureOrUserPosition = await getUserPosition(NoParams());
      failureOrUserPosition!.fold((failure) {
        emit(Error(message: _mapFailureToMessage(failure)));
      }, (userPosition) {
        emit(Loaded(userPosition: userPosition));
      });
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
