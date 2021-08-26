import 'dart:async';

import 'package:flutter/material.dart';

class ImageSliderDemo extends StatefulWidget {
  @override
  _ImageSliderDemoState createState() => _ImageSliderDemoState();
}

class _ImageSliderDemoState extends State<ImageSliderDemo> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  final _boxHeight = 150.0;
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // para incluir el scroll automatico la pageview
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_pageView(), _indicadorPageview()],
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Widget _pageView() {
    return Container(
        height: _boxHeight,
        child: PageView.builder(
          itemCount: imgList.length,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return FadeInImage(
              image: NetworkImage(imgList[index]),
              placeholder: AssetImage(
                  'assets/img/loading.gif'), // una imagen preterminada
              fit: BoxFit.cover,
            );
          },
          onPageChanged: _onPageChanged,
        ));
  }

  Widget _indicadorPageview() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              // un mapa de toda la lista de urls para hacer el indicador
              return GestureDetector(
                onTap: () => _onPageChanged, // para que sea automatico
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_currentPage == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          )),
    );
  }
}
