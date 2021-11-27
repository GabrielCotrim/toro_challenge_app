import 'package:equatable/equatable.dart';
import 'package:toro_challenge/core/usecases/use_case.dart';
import 'package:toro_challenge/features/presentation/bloc/generic/response_bloc.dart';

import '../../domain/entities/user_position.dart';
import '../../domain/usecases/get_user_position.dart';

part 'user_position_event.dart';

class UserPositionBloc extends ResponseBloc<UserPositionEvent> {
  final GetUserPosition getUserPosition;

  ResponseState get initialState => Empty();

  UserPositionBloc({
    required this.getUserPosition,
  }) : super(Empty()) {
    on<GetUserPositionEvent>((event, emit) async {
      emit(Loading());
      final failureOrUserPosition = await getUserPosition(NoParams());
      failureOrUserPosition!.fold((failure) {
        emit(Error(message: mapFailureToMessage(failure)));
      }, (userPosition) {
        emit(Loaded<UserPosition>(response: userPosition));
      });
    });
  }
}


