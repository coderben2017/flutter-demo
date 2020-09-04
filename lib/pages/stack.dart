import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('stack route'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose, // loose-未定位子元素保持自身大小，expand-按父容器大小
          children: <Widget>[
            Positioned(
              top: 10,
              child: Text('aaa'),
            ),
            Container(
              color: Colors.blue,
              child: Text('bbb'),
            ),
            Positioned(
              left: 10,
              child: Text('ccc'),
            )
          ],
        ),
      ),
    );
  }
}