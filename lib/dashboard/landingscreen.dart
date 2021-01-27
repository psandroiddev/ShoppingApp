import 'dart:async';

import 'package:flutter/material.dart';

import 'loginscreen.dart';

/*
class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text("Landing Screen",
        style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new Center (
        child: new Column(
          mainAxisSize:  MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton (
              onPressed: () {
                Navigator.of(context).pushNamed('/loginscreen');
              },
              child: new Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}*/

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => LoginScreen()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }

}

