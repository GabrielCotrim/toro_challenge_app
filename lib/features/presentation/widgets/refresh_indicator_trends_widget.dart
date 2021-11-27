import 'package:toro_challenge/core/widgets/platform_stateless_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toro_challenge/features/domain/entities/stock.dart';

class RefreshIndicatorTrendsWidget extends PlatformStatelessWidget {
  const RefreshIndicatorTrendsWidget({
    Key? key,
    required this.onRefresh,
    required this.onPayAction,
    required this.stocks,
  }) : super(key: key);

  final void Function(dynamic action)? onPayAction;
  final Future<void> Function() onRefresh;
  final List<Stock> stocks;

  void _onPay() {}

  Widget _buildStockDescription(Stock stock) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          stock.symbol,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "R\$${stock.currentPrice}",
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
          onRefresh: onRefresh,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final stock = stocks.elementAt(index);
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
                      CupertinoButton(
                        color: CupertinoTheme.of(context).primaryColor,
                        padding: const EdgeInsets.all(10.0),
                        child: const Text(
                          "Comprar",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: _onPay,
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: stocks.length,
          ),
        )
      ],
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (BuildContext context, int index) {
          final stock = stocks.elementAt(index);
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildStockDescription(stock),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Comprar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: _onPay,
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
