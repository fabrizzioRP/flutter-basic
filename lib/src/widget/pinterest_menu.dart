import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:componentes_app/src/providers/slider_img_provider.dart';

class PinterestButtomComponents {
  final VoidCallback onPressed;
  final IconData icon;

  const PinterestButtomComponents(
      {required this.icon, required this.onPressed});
}

class PinterestMenuWidget extends StatelessWidget {
  final List<PinterestButtomComponents> items;
  final bool mostrarMenu;
  final Color background;
  final Color activeColor;
  final Color inactiveColor;

  const PinterestMenuWidget({
    this.mostrarMenu = true,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    this.background = Colors.white,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: (this.mostrarMenu) ? 1 : 0,
      duration: Duration(milliseconds: 300),
      child: Builder(
        builder: (_) {
          Provider.of<SlidesImgProvider>(context, listen: false).activeColor =
              this.activeColor;
          Provider.of<SlidesImgProvider>(context, listen: false).inactiveColor =
              this.inactiveColor;
          Provider.of<SlidesImgProvider>(context, listen: false).background =
              this.background;

          return _MenuBackground(
            child: _MenuItems(items: items),
          );
        },
      ),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;

  const _MenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final background = Provider.of<SlidesImgProvider>(context).background;

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButtomComponents> items;

  const _MenuItems({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (i) => _Items(i, items[i])),
    );
  }
}

class _Items extends StatelessWidget {
  final int index;
  final PinterestButtomComponents item;

  const _Items(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final styleProvider = Provider.of<SlidesImgProvider>(context);

    Color colorSelect;
    double tamanoSelect;

    if (styleProvider.itemSeleccionado == index) {
      colorSelect = styleProvider.activeColor;
      tamanoSelect = 30;
    } else {
      colorSelect = styleProvider.inactiveColor;
      tamanoSelect = 25;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<SlidesImgProvider>(context, listen: false)
            .itemSeleccionado = index;
        item.onPressed();
      },
      child: Icon(
        item.icon,
        color: colorSelect,
        size: tamanoSelect,
      ),
    );
  }
}
