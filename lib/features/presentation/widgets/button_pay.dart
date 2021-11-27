import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toro_challenge/core/widgets/platform_stateless_widget.dart';

class ButtonPay extends PlatformStatelessWidget {
  const ButtonPay({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function() onPressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoButton(
      color: CupertinoTheme.of(context).primaryColor,
      padding: const EdgeInsets.all(10.0),
      child: const Text(
        "Comprar",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return ElevatedButton(
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
      onPressed: onPressed,
    );
  }
}
