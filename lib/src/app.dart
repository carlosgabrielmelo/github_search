import 'package:catcher/catcher_plugin.dart';
import 'package:flutter/material.dart';

import 'package:github_search/src/ui/SearchPage.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Catcher.navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: SearchPage(),
    );
  }
}