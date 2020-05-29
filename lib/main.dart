import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF832685),
        primaryColorLight: Color(0xFFC81379),
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String title = 'AnimatedSize';

  double _height = 100.0;
  double _width = 100.0;
  var _color = Colors.purple;
  bool _resize = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
          child: AnimatedSize(
        curve: Curves.elasticInOut,
        vsync: this,
        duration: Duration(seconds: 2),
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (_resize) {
                _resize = false;
                _color = Colors.purple;
                _height = 100.0;
                _width = 100.0;
              } else {
                _resize = true;
                _color = Colors.orange;
                _height = 300.0;
                _width = 300.0;
              }
            });
          },
          child: Container(
            width: _width,
            height: _height,
            color: _color,
          ),
        ),
      )),
    );
  }
}
