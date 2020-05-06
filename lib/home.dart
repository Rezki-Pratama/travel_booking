import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}




class _LoginState extends State<Login> {
  var animation = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlareActor(
            'assets/flare/splashtravel.flr',
            animation: (animation == 1)
                ? 'register'
                : (animation == 2) ? 'login' : 'splash',
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom : 70.0, right: 40.0),
              child: RaisedButton(
                  child: Text('Masuk'),
                  onPressed: () {
                      if (animation == 0) {
                        setState(() {
                          animation = 1;
                        });
                      } else if (animation == 1) {
                        setState(() {
                          animation = 2;
                        });
                      } else if (animation == 2){
                        setState(() {
                          animation = 1;
                        });
                      }
                      print(animation);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
