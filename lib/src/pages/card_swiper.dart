import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiperPage extends StatefulWidget {
  static final nameSwiper = 'swiper';
  @override
  _CardSwiperPageState createState() => _CardSwiperPageState();
}

class _CardSwiperPageState extends State<CardSwiperPage> {
  List<int> numImage = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Swiper', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        bottomOpacity: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: [
            getSwiper(size),
            _getColor(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purpleAccent,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Apps', icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Photo', icon: Icon(Icons.photo)),
        ],
      ),
    );
  }

  getSwiper(Size size) {
    return Swiper(
      itemCount: numImage.length,
      layout: SwiperLayout.STACK,
      itemWidth: size.width * 0.8,
      itemHeight: size.height * 0.4,
      itemBuilder: (context, int i) {
        final int nImage = numImage[i];
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300?random=$nImage'),
            width: 60,
            height: 50,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  _getColor() {
    if (_currentIndex == 0) {
      return Container(
        width: double.infinity,
        height: 300,
        color: Colors.red,
        child: Center(
          child: Text('Apps'),
        ),
      );
    } else if (_currentIndex == 1) {
      return Container(
          width: double.infinity,
          height: 300,
          color: Colors.green,
          child: Center(
            child: Text('Home'),
          ));
    } else if (_currentIndex == 2) {
      return Container(
        width: double.infinity,
        height: 300,
        color: Colors.white,
        child: Center(
          child: Text('Photo'),
        ),
      );
    }
  }
}
