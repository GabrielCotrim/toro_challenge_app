import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toro_challenge/app_theme.dart';

import '../../../core/widgets/platform_stateless_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeStatePage();
}

class _HomeStatePage extends PlatformStateWidget<HomePage> {
  int _selectedIndex = 0;

  static const TextStyle _optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const Text _titleBar = Text(
    AppTheme.appName,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: _optionStyle,
    ),
    Text(
      'Index 1: Carteira',
      style: _optionStyle,
    ),
  ];

  static const List<BottomNavigationBarItem> _bottomItens =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.wallet_giftcard),
      label: 'Carteira',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor:
            CupertinoTheme.of(context).primaryColor.withOpacity(0.5),
        middle: _titleBar,
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: _bottomItens,
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return Center(
                child: _widgetOptions.elementAt(index),
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        title: _titleBar,
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItens,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
