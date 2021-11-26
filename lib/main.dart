import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme.dart';
import 'core/widgets/platform_stateless_widget.dart';
import 'features/presentation/bloc/user_position_bloc.dart';
import 'features/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}

class App extends PlatformStatelessWidget {
  const App({Key? key}) : super(key: key);

  Widget _buildMultiBlocProvider(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserPositionBloc>(create: (context) => sl<UserPositionBloc>()),
      ],
      child: child,
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoApp(
      title: AppTheme.appName,
      theme: AppTheme.cupertinoTheme,
      home: _buildMultiBlocProvider(const HomePage()),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return MaterialApp(
      title: AppTheme.appName,
      theme: AppTheme.materialTheme,
      home: _buildMultiBlocProvider(const HomePage()),
    );
  }
}
