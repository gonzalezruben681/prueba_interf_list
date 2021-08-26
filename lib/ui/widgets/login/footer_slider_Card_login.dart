import 'package:flutter/material.dart';
import 'package:prueba/ui/widgets/login/Destacados_login.dart';
import 'package:prueba/ui/widgets/login/arrow_indicator_imagenes_login.dart';

class FooterSliderYCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
        height: _screenSize.height * 0.39,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          )
        ]),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [ArrowPageIndicatorImagenes(), sliderCard()],
            )));
  }

  Widget sliderCard() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.6),
        decoration: BoxDecoration(
          color: Color(0xFF346c94),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [DestacadosWidget()]));
  }
}
