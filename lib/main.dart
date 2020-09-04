import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter2/pages/flex.dart';
import 'package:flutter2/pages/form.dart';
import 'package:flutter2/pages/progress.dart';
import 'package:flutter2/pages/stack.dart';
import 'package:flutter2/pages/transform.dart';
import 'package:flutter2/pages/wrap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo1',
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        'new_page': (context) {
          String text = ModalRoute.of(context).settings.arguments;
          return NewRoute(text: text);
        },
        'state_page': (context) {
          return CounterWidget(initValue: 0);
        },
        'tab_box_a_page': (context) {
          return TabBoxA();
        },
        'font_page': (context) {
          return FontWidget();
        },
        'login_page': (context) {
          return LoginFormRoute();
        },
        'progress_page': (context) {
          return ProgressRoute();
        },
        'flex_page': (context) {
          return FlexRoute();
        },
        'wrap_page': (context) {
          return WrapRoute();
        },
        'stack_page': (context) {
          return StackRoute();
        },
        'transform_page': (context) {
          return TransformRoute();
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
            RandomWordsWidget(),
            RaisedButton.icon(
              icon: Icon(Icons.add),
              label: Text('navigator to new_route'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'new_page',
                    arguments: 'text to new page');
                print(res);
              },
            ),
            RaisedButton.icon(
              icon: Icon(Icons.favorite_border),
              label: Text('navigator to state_route'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'state_page');
                print(res);
              },
            ),
            FlatButton(
              child: Text('navigator to tab_box_a_page'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'tab_box_a_page');
                print(res);
              },
            ),
            FlatButton(
              child: Text('navigator to font_page'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'font_page');
                print(res);
              },
            ),
            FlatButton(
              child: Text('navigator to login_page'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'login_page');
                print(res);
              },
            ),
            FlatButton(
              child: Text('navigator to progress_page'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'progress_page');
                print(res);
              },
            ),
            FlatButton(
              child: Text('navigator to flex_page'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'flex_page');
                print(res);
              },
            ),
            FlatButton(
              child: Text('navigator to wrap_page'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'wrap_page');
                print(res);
              },
            ),
            FlatButton(
              child: Text('navigator to stack_page'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'stack_page');
                print(res);
              },
            ),
            FlatButton(
              child: Text('navigator to transform_page'),
              textColor: Colors.blue,
              onPressed: () async {
                var res = await Navigator.pushNamed(context, 'transform_page');
                print(res);
              },
            ),
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
          ),
          ScaffoldTitleWidget()
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

class ScaffoldTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
    return (scaffold.appBar as AppBar).title;
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue});

  final int initValue;

  @override
  _CountWidgetState createState() => _CountWidgetState();
}

class _CountWidgetState extends State<CounterWidget> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print('initState');
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            child: Text('$_counter'),
            onPressed: () => setState(() => ++_counter),
          ),
          StateChildWidget()
        ],
      )),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}

class StateChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('show bar'),
      onPressed: () {
        ScaffoldState parentState =
            context.findAncestorStateOfType<ScaffoldState>();
        parentState.showSnackBar(SnackBar(
          content: Text('i am bar'),
        ));
      },
    );
  }
}

//////////////////////////////

class TabBoxA extends StatefulWidget {
  TabBoxA({Key key}) : super(key: key);

  @override
  _TabBoxAState createState() => new _TabBoxAState();
}

class _TabBoxAState extends State<TabBoxA> {
  bool _isActive = false;

  void _handleChange(bool value) {
    setState(() {
      _isActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBoxAChild(
      isActive: _isActive,
      onChange: _handleChange,
    );
  }
}

class TabBoxAChild extends StatefulWidget {
  TabBoxAChild({Key key, this.isActive = false, @required this.onChange})
      : super(key: key);

  final bool isActive;
  final ValueChanged<bool> onChange;

  @override
  TabBoxAChildState createState() => new TabBoxAChildState();
}

class TabBoxAChildState extends State<TabBoxAChild> {
  bool _isHighlight = false;

  void _handleTab() {
    widget.onChange(!widget.isActive);
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isHighlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isHighlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isHighlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTab,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.isActive ? 'Active' : 'Inactive',
            style: TextStyle(
                fontSize: 50,
                color: widget.isActive ? Colors.blueAccent : Colors.white,
                decoration: TextDecoration.none),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: widget.isActive ? Colors.lightGreenAccent : Colors.grey,
            border: _isHighlight
                ? Border.all(color: Colors.redAccent, width: 10)
                : null),
      ),
    );
  }
}

//////////////////////////////////////////
class FontWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.network(
          'https://avatars2.githubusercontent.com/u/20411648?s=460&v=4',
          width: 200,
          height: 200,
        ),
        Text('\ue000',
            style: TextStyle(
                fontFamily: 'MaterialIcons',
                fontSize: 24,
                color: Colors.green,
                decoration: TextDecoration.none))
      ],
    );
  }
}
//////////////////////////////////////////

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
