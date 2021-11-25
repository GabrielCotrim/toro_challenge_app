import 'package:flutter/material.dart';

abstract class PlatformStatelessWidget extends StatelessWidget {
  const PlatformStatelessWidget({Key? key}) : super(key: key);

  Widget buildCupertinoWidget(BuildContext context);

  Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final _platform = Theme.of(context).platform;
    return _platform == TargetPlatform.iOS
        ? buildCupertinoWidget(context)
        : buildMaterialWidget(context);
  }
}

abstract class PlatformStateWidget<T extends StatefulWidget> extends State<T> {
  Widget buildCupertinoWidget(BuildContext context);

  Widget buildMaterialWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final _platform = Theme.of(context).platform;
    return _platform == TargetPlatform.iOS
        ? buildCupertinoWidget(context)
        : buildMaterialWidget(context);
  }
}
