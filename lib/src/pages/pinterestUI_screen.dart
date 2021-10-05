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

class _PinterestGrid extends StatefulWidget {
  @override
  __PinterestGridState createState() => __PinterestGridState();
}

class __PinterestGridState extends State<_PinterestGrid> {
  final List<int> items = List.generate(100, (index) => index);

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
      itemCount: items.length,
      itemBuilder: (_, i) => _PinterestItems(i),
      staggeredTileBuilder: (i) => StaggeredTile.count(2, i.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItems extends StatelessWidget {
  final int index;
  const _PinterestItems(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        // aca cambiar el contenido para poner imagenes :
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('$index'),
          ),
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
