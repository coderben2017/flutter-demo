import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo1',
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        'new_page': (context) {
          String text = ModalRoute.of(context).settings.arguments;
          return NewRoute(text: text);
        },
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final String name = 'aarika';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    testFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '你的点击次数:$name',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text('navigator to new route'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'new_page', arguments: 'text to new page');
                print(res);
              },
            ),
            RandomWordsWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  NewRoute({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('new route')),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(text),
              FlatButton(
                child: Text('go back'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context, {'msg': 'i am return text'});
                },
              )
            ],
          )),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final word = new WordPair.random();
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(word.toString()),
    );
  }
}

void testFuture() {
  Future.wait([
    // 2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      return " world";
    })
  ]).then((results) {
    print(results[0] + results[1]);
  }).catchError((e) {
    print(e);
  });
}
