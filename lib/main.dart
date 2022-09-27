import 'package:calculator/lib/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/lib/themes.dart';

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
      title: "Calculator",
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firnum;
  int secondnum;
  String textodisplay = "";
  String res;
  String operationtoperform;

  void btnclicked(String btntext){
    if (btntext == "c"){
      textodisplay = "";
      firnum = 0;
      secondnum = 0;
      res = "";
    }else if(btntext == "+" || btntext == "-" || btntext == "x" || btntext == "/"){
      firnum = int.parse(textodisplay);
      res = "";
      operationtoperform = btntext;
    }
    else if(btntext == "="){
      secondnum = int.parse(textodisplay);
      if(operationtoperform == "+"){
        res = (firnum + secondnum).toString();
      }
      if(operationtoperform == "-"){
        res = (firnum - secondnum).toString();
      }
      if(operationtoperform == "x"){
        res = (firnum * secondnum).toString();
      }
      if(operationtoperform == "/"){
        res = (firnum ~/ secondnum).toString();
      }
    }else{
      res = int.parse(textodisplay + btntext).toString();
    }
    setState(() {

      textodisplay = res;
    });
  }

  Widget build(BuildContext context) {
    Widget basharButton(String btnval){
      return Expanded(
        child: MaterialButton(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03,bottom: MediaQuery.of(context).size.height*0.03,
          left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.03,
          ),
          onPressed: () => btnclicked(btnval),
          child: Text(
            "$btnval",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator.alienwear"),
      ),
      drawer: Drawer(
        child: HomePages(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.015,bottom: MediaQuery.of(context).size.height*0.015,
                  left: MediaQuery.of(context).size.width*0.03,right: MediaQuery.of(context).size.width*0.08,
                ),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$textodisplay",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                basharButton("7"),
                basharButton("8"),
                basharButton("9"),
                basharButton("+"),
              ],
            ),
            Row(
              children: [
                basharButton("4"),
                basharButton("5"),
                basharButton("6"),
                basharButton("-"),
              ],
            ),
            Row(
              children: [
                basharButton("1"),
                basharButton("2"),
                basharButton("3"),
                basharButton("x"),
              ],
            ),
            Row(
              children: [
                basharButton("c"),
                basharButton("0"),
                basharButton("="),
                basharButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

