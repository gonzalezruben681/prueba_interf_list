import 'package:flutter/material.dart';

class SliderImagenes extends StatelessWidget {
  final pathImage = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  SliderImagenes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10.0), // margenes del contenedor
      height: _screenSize.height * 0.10,
      color: Color(0xFF346c94),
      child: PageView.builder(
        itemCount: pathImage.length,
        controller: PageController(initialPage: 1, viewportFraction: 0.6),
        itemBuilder: (BuildContext context, int index) {
          return CardImagen(pathImage: pathImage[index]);
        }, // sirve para cuantos mostrar en el pagevie
      ),
    );
  }
}

class CardImagen extends StatelessWidget {
  const CardImagen({
    Key? key,
    required this.pathImage,
  }) : super(key: key);

  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      width: 150.0,
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: FadeInImage(
            // image: NetworkImage( pelicula.getPosterImg()  ),
            image: NetworkImage(pathImage),
            placeholder:
                AssetImage('assets/img/loading.gif'), // una imagen preterminada
            fit: BoxFit.cover,
            width: 150.0),
      ),
      decoration: BoxDecoration(
          // Decoración de caja
          /*  image: DecorationImage(
              image:
                  NetworkImage(pathImage), // src donde se encuentra la imagen
              fit: BoxFit.cover),*/ // para que se ajuste la imagen
          // Decoración de caja
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 1.0,
                offset: Offset(1.0, 1.0),
                spreadRadius: 1.0)
          ], // borde circular
          shape: BoxShape.rectangle),
    );
  }
}
