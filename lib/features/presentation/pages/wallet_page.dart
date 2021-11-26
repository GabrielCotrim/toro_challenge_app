import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_position_bloc.dart';
import '../widgets/loading_widget.dart';
import '../widgets/message_display.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  static final Text _title = Text(
    "Carteira",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey.shade800,
    ),
  );

  Widget _buildSaldoInfo(double saldo, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "R\$$saldo",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _platform = Theme.of(context).platform;
    return BlocBuilder<UserPositionBloc, UserPositionState>(
      builder: (BuildContext context, UserPositionState state) {
        if (state is Loading) {
          return const LoadingWidget();
        } else if (state is Loaded) {
          final userPosition = state.userPosition;
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
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _buildSaldoInfo(
                          userPosition.checkingAccountAmount, "Saldo"),
                      _buildSaldoInfo(userPosition.consolidated, "Sumarizado"),
                    ],
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: _platform == TargetPlatform.iOS ? 0.0 : 1.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ativos",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                final position =
                                    userPosition.positions.elementAt(index);
                                return Card(
                                  elevation: _platform == TargetPlatform.iOS
                                      ? 0.0
                                      : 2.0,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              position.symbol,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "${position.amount}x",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "R\$${position.currentPrice}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey.shade800,
                                              ),
                                            ),
                                            Text(
                                              "R\$${position.currentPrice * position.amount}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: userPosition.positions.length,
                            ),
                          ),
                        ],
                      ),
                    ),
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
