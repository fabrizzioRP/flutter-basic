import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:componentes_app/src/providers/slider_img_provider.dart';

class CustomSlidesImage extends StatelessWidget {
  final List<Widget> slides;
  // final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const CustomSlidesImage({
    required this.slides,
    // this.puntosArriba = false,
    this.colorPrimario = Colors.pink,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12.0,
    this.bulletSecundario = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SlidesImgProvider(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Future.delayed(Duration(milliseconds: 10), () {
                Provider.of<SlidesImgProvider>(context, listen: false)
                    .primaryColor = this.colorPrimario;
                Provider.of<SlidesImgProvider>(context, listen: false)
                    .secondColor = this.colorSecundario;
                Provider.of<SlidesImgProvider>(context, listen: false)
                    .primaryBullet = this.bulletPrimario;
                Provider.of<SlidesImgProvider>(context, listen: false)
                    .secondBullet = this.bulletSecundario;
              });

              return _ColumnBody(slides);
            },
          ),
        ),
      ),
    );
  }
}

class _ColumnBody extends StatelessWidget {
  const _ColumnBody(this.slides);

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _SLides(this.slides)),
        _Dots(this.slides.length),
      ],
    );
  }
}

class _SLides extends StatefulWidget {
  final List<Widget> slides;
  const _SLides(this.slides);

  @override
  __SLidesState createState() => __SLidesState();
}

class __SLidesState extends State<_SLides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<SlidesImgProvider>(context, listen: false).index =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        physics: BouncingScrollPhysics(),
        controller: this.pageViewController,
        children: widget.slides.map((image) => _Slide(image)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget image;
  const _Slide(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: double.infinity,
      child: this.image,
    );
  }
}

class _Dots extends StatelessWidget {
  final int cantidadPage;
  const _Dots(this.cantidadPage);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.cantidadPage, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<SlidesImgProvider>(context);
    Color color;
    double tamano;

    if (pageProvider.index >= this.index - 0.5 &&
        pageProvider.index < index + 0.5) {
      tamano = pageProvider.primaryBullet;
      color = pageProvider.primaryColor;
    } else {
      tamano = pageProvider.secondBullet;
      color = pageProvider.secondColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
