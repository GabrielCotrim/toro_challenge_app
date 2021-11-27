import 'package:equatable/equatable.dart';
import 'package:toro_challenge/features/domain/entities/position.dart';
import 'package:toro_challenge/features/domain/usecases/post_order_stock.dart';
import 'package:toro_challenge/features/presentation/bloc/generic/response_bloc.dart';

part 'order_stock_event.dart';

enum StatusOrder {
  loading,
  success,
  error,
}
class OrderStockBloc extends ResponseBloc<OrderStockEvent> {
  final PostOrderStock postOrderStock;

  ResponseState get initialState => Empty();

  OrderStockBloc({
    required this.postOrderStock,
  }) : super(Empty()) {
    on<PostOrderStockEvent>((event, emit) async {
      emit(Loading());
      final failureOrUserPosition = await postOrderStock(OrderParams(
        symbol: event.symbol,
        amount: event.amount,
      ));
      failureOrUserPosition!.fold((failure) {
        emit(Error(message: mapFailureToMessage(failure)));
      }, (position) {
        emit(Loaded<Position>(response: position));
      });
    });
  }
}
