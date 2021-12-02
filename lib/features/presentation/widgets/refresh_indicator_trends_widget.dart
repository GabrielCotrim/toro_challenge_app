import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/platform_stateless_widget.dart';
import '../../domain/entities/stock.dart';
import '../bloc/generic/response_bloc.dart';
import '../bloc/order_stock_bloc.dart';
import '../bloc/user_position_bloc.dart';
import 'button_pay.dart';
import 'increment_control.dart';

class RefreshIndicatorTrendsWidget extends StatefulWidget {
  const RefreshIndicatorTrendsWidget({
    Key? key,
    required this.onRefresh,
    required this.onPayAction,
    required this.stocks,
  }) : super(key: key);

  final void Function(dynamic action)? onPayAction;
  final Future<void> Function() onRefresh;
  final List<Stock> stocks;

  @override
  State<RefreshIndicatorTrendsWidget> createState() =>
      RefreshIndicatorTrendsWidgetState();
}

class RefreshIndicatorTrendsWidgetState
    extends PlatformStateWidget<RefreshIndicatorTrendsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<OrderStockBloc>().stream.listen((event) {
      if (event is Loaded) {
        _showSnackBar("Sucesso");
        context.read<UserPositionBloc>().add(GetUserPositionEvent());
      } else if (event is Error) {
        _showSnackBar("Falha na compra");
      }
    });
  }

  void _onPay(String symbol, int amount) {
    context.read<OrderStockBloc>().add(
          PostOrderStockEvent(
            symbol: symbol,
            amount: amount,
          ),
        );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: "Fechar",
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _buildStockDescription(Stock stock) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          stock.symbol,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "R\$${stock.currentPrice.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: widget.onRefresh,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final stock = widget.stocks.elementAt(index);
              int _amount = 1;
              return Card(
                elevation: 0.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildStockDescription(stock),
                      Column(
                        children: [
                          ButtonPay(onPressed: () {
                            _onPay(stock.symbol, _amount);
                          }),
                          IncrementControl(
                            onRefreshAmount: (int amount) => _amount = amount,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: widget.stocks.length,
          ),
        )
      ],
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: ListView.builder(
        itemCount: widget.stocks.length,
        itemBuilder: (BuildContext context, int index) {
          final stock = widget.stocks.elementAt(index);
          int _amount = 1;
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildStockDescription(stock),
                  Column(
                    children: [
                      ButtonPay(onPressed: () {
                        _onPay(stock.symbol, _amount);
                      }),
                      IncrementControl(
                        onRefreshAmount: (int amount) => _amount = amount,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
