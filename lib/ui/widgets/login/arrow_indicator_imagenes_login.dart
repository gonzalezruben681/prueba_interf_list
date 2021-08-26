import 'package:flutter/material.dart';
import 'package:page_view_indicators/arrow_page_indicator.dart';

class ArrowPageIndicatorImagenes extends StatefulWidget {
  @override
  ArrowPageIndicatorImagenesState createState() {
    return new ArrowPageIndicatorImagenesState();
  }
}

class ArrowPageIndicatorImagenesState
    extends State<ArrowPageIndicatorImagenes> {
  final List<String> _imgList = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  final _pageController = PageController(initialPage: 1);
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(12),
        width: _screenSize.width * 0.90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mercado Pacific',
              style: TextStyle(color: Color(0xFF346c94)),
            ),
            ArrowPageIndicator(
              iconPadding: EdgeInsets.symmetric(horizontal: 10.0),
              isInside: false,
              rightIcon: Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xFF346c94),
                size: 20.0,
              ),
              leftIcon: Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xFF346c94),
                size: 20.0,
              ),
              pageController: _pageController,
              currentPageNotifier: _currentPageNotifier,
              itemCount: (_imgList.length / 2).round() - 1,
              child: _tarjetas(_pageController, _currentPageNotifier),
            ),
          ],
        ));
  }

  _tarjetas(PageController pageController, ValueNotifier currentPageNotifier) =>
      Container(
        //  color: Colors.black,
        height: 100,
        child: PageView.builder(
            itemCount: (_imgList.length / 2).round() - 1,
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              final int first = index * 2; // páginas a mostrar
              final int second = first + 1;
              final int thrid = second + 1;
              return Row(
                children: [first, second, thrid].map((index) {
                  return Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: FadeInImage(
                          // En esta propiedad colocamos la imagen a descargar
                          image: NetworkImage(_imgList[index]),
                          // En esta propiedad colocamos el gif o imagen de carga
                          // debe estar almacenado localmente
                          placeholder: AssetImage('assets/img/loading.gif'),
                          // En esta propiedad colocamos mediante el objeto BoxFit
                          // la forma de acoplar la imagen en su contenedor
                          fit: BoxFit.cover,
                          // En esta propiedad colocamos el alto de nuestra imagen
                          height: 260,
                        ),
                      ),
                      decoration: BoxDecoration(
                          // Decoración de caja

                          // para que se ajuste la imagen
                          // Decoración de caja
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          shape: BoxShape.rectangle),
                    ),
                  );
                }).toList(),
              );
            },
            onPageChanged: (int index) {
              currentPageNotifier.value = index;
            }),
      );
}
