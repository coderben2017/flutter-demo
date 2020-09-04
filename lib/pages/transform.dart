import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransformRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransformRoute'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          constraints: BoxConstraints.tightFor(width: 200, height: 150),
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.topLeft,
                  colors: [Colors.red, Colors.orange],
                  radius: .98),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54, offset: Offset(2, 2), blurRadius: 4)
              ]),
          alignment: Alignment.center,
          transform: Matrix4.skewY(.3),
          child: Text(
            '5.20',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
