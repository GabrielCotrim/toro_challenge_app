import 'package:toro_challenge/core/widgets/platform_stateless_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorTrendsWidget extends PlatformStatelessWidget {
  const RefreshIndicatorTrendsWidget({
    Key? key,
    required this.onRefresh,
    required this.onPayAction,
  }) : super(key: key);

  final void Function(dynamic action)? onPayAction;
  final Future<void> Function() onRefresh;

  void _onPay() {}

  static const List<Widget> _actions = <Widget>[
    Text(
      "TORO4",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      "115.98",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  ];

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
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _actions,
                      ),
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
            childCount: 5,
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
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _actions,
                  ),
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
