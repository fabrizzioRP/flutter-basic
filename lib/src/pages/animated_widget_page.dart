import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimatedWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Widget'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: AnimatedCuadrado(),
      ),
    );
  }
}

class AnimatedCuadrado extends StatefulWidget {
  @override
  _AnimatedCuadradoState createState() => _AnimatedCuadradoState();
}

class _AnimatedCuadradoState extends State<AnimatedCuadrado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moveRight;
  late Animation<double> agrandarWidget;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));

    opacidad = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.30, curve: Curves.bounceInOut)));

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceInOut)));

    moveRight = Tween(begin: 0.0, end: 200.0).animate(controller);

    agrandarWidget = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.20, 0.30, curve: Curves.easeIn)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(),
      builder: (_, widget) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Rotacion :
            Transform.rotate(
              angle: rotacion.value,
              child: widget,
            ),
            SizedBox(height: 40),
            // Rotacion con Opacidad :
            Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidad.value,
                child: widget,
              ),
            ),
            SizedBox(height: 40),
            // Moviento de lugar con rotacion y opacidad :
            Transform.translate(
              offset: Offset(moveRight.value, 0),
              child: Transform.rotate(
                angle: rotacion.value,
                child: Opacity(
                  opacity: opacidad.value - opacidadOut.value,
                  child: widget,
                ),
              ),
            ),
            SizedBox(height: 40),
            // Agrandar widget on opacidad :
            Transform.scale(
              scale: agrandarWidget.value,
              child: Opacity(
                opacity: opacidad.value,
                child: widget,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Cuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.orange),
    );
  }
}
