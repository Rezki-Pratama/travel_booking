import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_booking/utilities/app_style.dart';
import 'package:travel_booking/widgets/circle_button.dart';
import 'package:travel_booking/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = new GlobalKey<FormState>();
  var animation = 0, click = 1, duration = 0, _autoValidate = false;
  String email, password, name;

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Timer(new Duration(seconds: 5), () {
      setState(() {
        duration = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          FlareActor(
            'assets/flare/splashtravel.flr',
            animation: (animation == 1)
                ? 'register'
                : (animation == 2) ? 'login' : 'splash',
            fit: BoxFit.cover,
          ),
          (duration == 1)
              ? Form(
                  key: _key,
                  autovalidate: _autoValidate,
                  child: Stack(
                    children: <Widget>[
                      ListView(
                        children: <Widget>[
                          SizedBox(
                              height: (animation == 1)
                                  ? MediaQuery.of(context).size.width * 0.4
                                  : MediaQuery.of(context).size.width * 0.6),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              (click == 2)
                                  ? CustomTextField(
                                      name: 'Name',
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'Please insert name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (e) => email = e,
                                    )
                                  : Container(),
                              CustomTextField(
                                name: 'Email',
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return 'Please insert email';
                                  } else if (!e.contains("@")) {
                                    return 'Wrong format email';
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (e) => email = e,
                              ),
                              CustomTextField(
                                name: 'Password',
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert password";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (e) => password = e,
                              )
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 70.0, right: 40.0, left: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4.0,
                                          spreadRadius: 1.0,
                                          offset: Offset(2.0,
                                              2.0), // shadow direction: bottom right
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                          AppStyle.darkGrey,
                                          AppStyle.lightGrey
                                        ],
                                      )),
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      check();
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Center(
                                          child: Text(
                                            (animation == 1)
                                                ? 'Sign Up'
                                                : 'Sign In',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                                CircleButton(
                                  icon: (animation == 1)
                                      ? FontAwesomeIcons.signInAlt
                                      : FontAwesomeIcons.userEdit,
                                  iconSize: 35.0,
                                  onPressed: () {
                                    if (animation == 0) {
                                      setState(() {
                                        animation = 1;
                                        click = 2;
                                      });
                                    } else if (animation == 1) {
                                      setState(() {
                                        animation = 2;
                                        click = 1;
                                      });
                                    } else if (animation == 2) {
                                      setState(() {
                                        animation = 1;
                                        click = 2;
                                      });
                                    }
                                    print(click);
                                  },
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
