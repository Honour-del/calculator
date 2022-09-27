import 'package:flutter/material.dart';
import 'package:calculator/lib/home.dart';
import 'package:calculator/lib/themes.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
    create: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(
      ),
    );
  }
}


class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages(),
      theme: theme.getTheme(),
    );
  }
}
