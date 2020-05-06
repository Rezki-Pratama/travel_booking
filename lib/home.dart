import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                padding: const EdgeInsets.only(bottom: 70.0, right: 40.0),
                child: CircleButton(
                  icon: (animation == 1)
                      ? FontAwesomeIcons.userEdit
                      : FontAwesomeIcons.signInAlt,
                  iconSize: 35.0,
                  onPressed: () {
                    if (animation == 0) {
                      setState(() {
                        animation = 1;
                      });
                    } else if (animation == 1) {
                      setState(() {
                        animation = 2;
                      });
                    } else if (animation == 2) {
                      setState(() {
                        animation = 1;
                      });
                    }
                    print(animation);
                  },
                )),
          )
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;

  CircleButton({this.icon, this.onPressed, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.grey[900],
              Colors.grey[500],
            ],
          )),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Icon(
          icon,
          size: iconSize,
        ),
        padding: EdgeInsets.all(15.0),
        shape: CircleBorder(),
      ),
    );
  }
}
