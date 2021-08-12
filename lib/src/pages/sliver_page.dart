import 'dart:math';

import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  static final nameSliver = 'sliver';

  final rnd = new Random();

  List<Color> pallet = [
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.lightGreenAccent,
    Colors.white,
    Colors.purple,
    Colors.pink,
    Colors.purple,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        20,
        (index) => Container(
              width: double.infinity,
              height: 150,
              color: pallet[rnd.nextInt(this.pallet.length)],
            ));

    return Scaffold(
      body: CustomScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          SliverAppBar(
              floating: true,
              pinned: true,
              title: Text('Sliver AppBar'),
              centerTitle: true,
              expandedHeight: 275,
              flexibleSpace: FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                    'https://ximenaperedo.files.wordpress.com/2012/12/galaxia-11.jpg'),
                fit: BoxFit.cover,
              )),
          SliverList(
            delegate: SliverChildListDelegate(items),
          ),
        ],
      ),
    );
  }
}
