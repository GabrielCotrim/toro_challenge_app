import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'core/widgets/platform_stateless_widget.dart';
import 'features/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends PlatformStatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoApp(
      title: AppTheme.appName,
      theme: AppTheme.cupertinoTheme,
      home: const HomePage(),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return MaterialApp(
      title: AppTheme.appName,
      theme: AppTheme.materialTheme,
      home: const HomePage(),
    );
  }
}
