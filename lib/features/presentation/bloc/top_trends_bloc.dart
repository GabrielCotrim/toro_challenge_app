import 'package:equatable/equatable.dart';
import 'package:toro_challenge/core/usecases/use_case.dart';
import 'package:toro_challenge/features/domain/entities/stock.dart';
import 'package:toro_challenge/features/domain/usecases/get_top_trends.dart';
import 'package:toro_challenge/features/presentation/bloc/generic/response_bloc.dart';

part 'top_trends_event.dart';

class TopTrendsBLoc extends ResponseBloc<TopTrendsEvent> {
  final GetTopTrends getTopTrends;

  ResponseState get initialState => Empty();

  TopTrendsBLoc({
    required this.getTopTrends,
  }) : super(Empty()) {
    on<GetTopTrendsEvent>((event, emit) async {
      emit(Loading());
      final failureOrUserPosition = await getTopTrends(NoParams());
      failureOrUserPosition!.fold((failure) {
        emit(Error(message: mapFailureToMessage(failure)));
      }, (topTrends) {
        emit(Loaded<List<Stock>>(response: topTrends));
      });
    });
  }
}
