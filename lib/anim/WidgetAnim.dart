import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetAnim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: ' args.title');
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: AnimatedPhysicalModel(
            animateShadowColor: true,
            borderRadius: _visible
                ? BorderRadius.circular(10)
                : BorderRadius.circular(100),
            shape: BoxShape.rectangle,
            elevation: _visible ? 5.0 : 10.0,
            color: _visible ? Colors.red : Colors.blue,
            shadowColor: _visible ? Colors.red : Colors.blue,
            duration: Duration(milliseconds: 500),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: _visible
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(100),
              ),
              width: _visible ? 200 : 200,
              height: _visible ? 200 : 200,

            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          tooltip: "Toggle Opacity",
          child: Icon(_visible ?Icons.toggle_on_sharp:Icons.toggle_off_sharp),
        ),
      ),
    );
  }
}
