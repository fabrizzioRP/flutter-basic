import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:componentes_app/src/widget/pinterest_menu.dart';
import 'package:componentes_app/src/providers/slider_img_provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestUIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      leading: Padding(
        padding: EdgeInsets.all(7.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'http://assets.stickpng.com/images/58e9199beb97430e819064fc.png'),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 1,
      title: Text(
        'Pinterest UI',
        style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300),
      ),
      actions: [
        IconButton(
          tooltip: 'Home',
          icon: Icon(
            Icons.home,
            color: Colors.black38,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    return ChangeNotifierProvider(
      create: (_) => SlidesImgProvider(),
      child: Scaffold(
        appBar: appBar2,
        backgroundColor: Colors.grey.shade100,
        body: Stack(
          children: [
            // Grid :
            _PinterestGrid(),
            // Bottom Menu :
            _MenuButtomsLocation(),
          ],
        ),
      ),
    );
  }
}

const List ITEMS = [
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
  {
    'image': "https://assets.swappie.com/SwappieiPhoneSE2020128Red.jpg",
    'nombre': 'iphone XR',
    'precio': "100.0"
  },
];

class _PinterestGrid extends StatefulWidget {
  @override
  __PinterestGridState createState() => __PinterestGridState();
}

class __PinterestGridState extends State<_PinterestGrid> {
  //final List<int> items = List.generate(100, (index) => index);

  ScrollController controller = ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      //controller.offset;

      if (controller.offset > scrollAnterior && controller.offset > 150) {
        //print('ocultar menu');
        Provider.of<SlidesImgProvider>(context, listen: false).showMenu = false;
      } else {
        //print('mostrar menu');
        Provider.of<SlidesImgProvider>(context, listen: false).showMenu = true;
      }

      scrollAnterior = controller.offset;
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
    return StaggeredGridView.countBuilder(
      controller: controller,
      physics: BouncingScrollPhysics(),
      crossAxisCount: 4,
      itemCount: ITEMS.length,
      itemBuilder: (_, i) => _PinterestItems(
          ITEMS[i]['image'], ITEMS[i]['nombre'], ITEMS[i]['precio']),
      staggeredTileBuilder: (i) => StaggeredTile.count(2, i.isEven ? 3.5 : 2.5),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItems extends StatelessWidget {
  final String image;
  final String nombre;
  final String precio;
  const _PinterestItems(this.image, this.nombre, this.precio);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage('${this.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              '${this.nombre}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
            Text(
              '\$ ${this.precio}',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class _MenuButtomsLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 30,
      child: Container(
        width: mediaQuery,
        child: Align(
          alignment: Alignment.center,
          child: PinterestMenuWidget(
            mostrarMenu: Provider.of<SlidesImgProvider>(context).showMenu,
            items: [
              PinterestButtomComponents(
                  icon: Icons.pie_chart,
                  onPressed: () => print('icon pie chart')),
              PinterestButtomComponents(
                  icon: Icons.search, onPressed: () => print('icon search')),
              PinterestButtomComponents(
                  icon: Icons.notifications,
                  onPressed: () => print('icon notifications')),
              PinterestButtomComponents(
                  icon: Icons.supervised_user_circle,
                  onPressed: () => print('icon supervised_user_circle')),
            ],
          ),
        ),
      ),
    );
  }
}
