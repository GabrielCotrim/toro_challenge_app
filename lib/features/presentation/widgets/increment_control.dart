import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IncrementControl extends StatefulWidget {
  const IncrementControl({
    Key? key,
    required this.onRefreshAmount,
  }) : super(key: key);

  final void Function(int amount) onRefreshAmount;

  @override
  State<IncrementControl> createState() => IncrementControlState();
}

class IncrementControlState extends State<IncrementControl> {

  int _amount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (_amount == 1) return;
            setState(() {
              widget.onRefreshAmount(_amount -= 1);
            });
          },
          icon: const Icon(Icons.remove),
        ),
        Text("$_amount"),
        IconButton(
          onPressed: () {
            setState(() {
              widget.onRefreshAmount(_amount += 1);
            });
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
