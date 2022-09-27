
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //color: Colors.blue,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.9,
              child: Container(
                //color: Colors.blue,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.2,
                    bottom: MediaQuery.of(context).size.height*0.2,
                    right: MediaQuery.of(context).size.width*0.2,
                    left: MediaQuery.of(context).size.width*0.2),
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("About the developer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Divider(thickness: 2,),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            Container(child: Column(
              children: [
                Text(
                    "This app is developed by alienwear",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "Copyright 2020",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
