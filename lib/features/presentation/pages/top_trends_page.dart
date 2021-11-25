import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/refresh_indicator_trends_widget.dart';

class TopTrendsPage extends StatefulWidget {
  const TopTrendsPage({Key? key}) : super(key: key);

  @override
  State<TopTrendsPage> createState() => _TopTrendsState();
}

class _TopTrendsState extends State<TopTrendsPage> {
  static const Text _subtitle = Text(
    "Principais ações",
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),
  );

  static final Text _title = Text(
    "Bolsa de valores",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey.shade800,
    ),
  );

  Future _onRefresh() async {}
  void _onPayAction(dynamic action) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: _title,
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: _subtitle,
          ),
          Expanded(
            child: RefreshIndicatorTrendsWidget(
              onRefresh: _onRefresh,
              onPayAction: _onPayAction,
            ),
          ),
        ],
      ),
    );
  }
}
