import 'package:componentes_app/src/widget/slides_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _MySlidesShow()),
          // Expanded(child: _MySlidesShow()),
          // Expanded(child: _MySlidesShow()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        tooltip: 'Home',
        backgroundColor: Colors.pink,
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _MySlidesShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomSlidesImage(
      //colorSecundario: ,
      colorPrimario: Colors.pink,
      bulletPrimario: 18,
      bulletSecundario: 12,
      slides: List.generate(
        5,
        (i) {
          i++;
          return SvgPicture.asset('assets/svgs/slide-$i.svg');
        },
      ),
    );
  }
}
