import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginFormRoute extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => new _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormRoute> {
  TextEditingController _loginNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Form(
              key: _globalKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: '用户名',
                          hintText: '请输入用户名',
                          icon: Icon(Icons.account_circle)),
                      controller: _loginNameController,
                      maxLength: 20,
                      validator: (value) {
                        if (value.trim().length == 0) return '请输入用户名';
                        return null;
                      }),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: '密码',
                          hintText: '请输入至少6位密码',
                          icon: Icon(Icons.lock)),
                      controller: _passwordController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.trim().length == 0) return '请输入密码';
                        if (value.trim().length < 6) return '密码至少为6位';
                        return null;
                      }),
                  Row(
                    children: <Widget>[
                      Expanded(child: Builder(builder: (context) {
                        return RaisedButton.icon(
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            icon: Icon(Icons.airplanemode_active),
                            label: Text('登录'),
                            onPressed: () {
                              if (Form.of(context).validate()) {
                                print(_loginNameController.text);
                                print(_passwordController.text);
                              }
                            });
                      })),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(child: Builder(builder: (context) {
                        return RaisedButton.icon(
                            color: Colors.grey,
                            textColor: Colors.white,
                            icon: Icon(Icons.clear_all),
                            label: Text('重置'),
                            onPressed: () {
                              Form.of(context).reset();
                            });
                      }))
                    ],
                  )
                ],
              ))),
    );
  }
}
