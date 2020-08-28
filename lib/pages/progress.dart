import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => new _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LinearProgressIndicator(
          value: 0.5,
          valueColor: AlwaysStoppedAnimation(Colors.blue),
          backgroundColor: Colors.grey,
        ),
        CircularProgressIndicator(
          value: 0.8,
          valueColor: AlwaysStoppedAnimation(Colors.pink),
          backgroundColor: Colors.lightGreen,
        ),
        SizedBox(
          width: 300,
          height: 200,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.pink),
            backgroundColor: Colors.lightGreen,
          ),
        ),
      ],
    );
  }
}
