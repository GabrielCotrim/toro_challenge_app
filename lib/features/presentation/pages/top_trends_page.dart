import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toro_challenge/features/domain/entities/stock.dart';
import 'package:toro_challenge/features/presentation/bloc/generic/response_bloc.dart';
import 'package:toro_challenge/features/presentation/bloc/top_trends_bloc.dart';
import 'package:toro_challenge/features/presentation/widgets/loading_widget.dart';
import 'package:toro_challenge/features/presentation/widgets/message_display.dart';

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

  Future _onRefresh() async {
    context.read<TopTrendsBLoc>().add(GetTopTrendsEvent());
  }

  void _onPayAction(dynamic action) {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopTrendsBLoc, ResponseState>(
      builder: (BuildContext context, ResponseState state) {
        if (state is Loading) {
          return const LoadingWidget();
        } else if (state is Loaded<List<Stock>>) {
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
                    stocks: state.response,
                  ),
                ),
              ],
            ),
          );
        } else if (state is Error) {
          return MessageDisplay(message: state.message);
        }
        return Container();
      },
    );
  }
}
