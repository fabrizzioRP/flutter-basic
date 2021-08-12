import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.orange;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Animated Container'),
          centerTitle: true,
        ),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(color: _color, borderRadius: _borderRadius),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: _changeColor,
        ),
      ),
    );
  }

  void _changeColor() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
