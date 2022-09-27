
import 'package:calculator/lib/About.dart';
import 'package:flutter/material.dart';
import 'package:calculator/lib/themes.dart';
import 'themes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePages(),
      ),
    );
  }
}

class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Change your theme here",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Divider(),
            FlatButton.icon(
              onPressed: () => _themeChanger.setTheme(ThemeData.dark()),
              icon: Icon(Icons.brightness_2),
              label: new Text("Dark Theme"),
            ),
            FlatButton.icon(
              onPressed: () => _themeChanger.setTheme(ThemeData.light()),
              label: Text("Light Theme"),
              icon: Icon(Icons.lightbulb_outline),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)  => About() ));
                  },
                  child: Text("About"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
