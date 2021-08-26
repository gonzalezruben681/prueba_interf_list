import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DestacadosWidget extends StatefulWidget {
  @override
  _DestacadosState createState() => _DestacadosState();
}

class _DestacadosState extends State<DestacadosWidget> {
  final controller = PageController();

  final List<String> title = ['TEXT', 'TEXT2', 'TEXT3'];
  final List<String> descripcion = [
    'fdgafgaf asdgfagfadf afgafg',
    'adfgafgafgafgfgdg',
    'afgfgafafgaafdgadfgafa afgfgagf huihiuhuihui'
  ];
  final List<String> _imgList = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      //height: _screenSize.width * 0.55,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //SizedBox(height: 5),
          Text('Destacados', style: TextStyle(color: Colors.white)),
          Container(
            height: _screenSize.height * 0.14,
            child: PageView.builder(
              itemCount: title.length,
              controller: controller,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xFF4454d4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Row(
                      children: [
                        Expanded(
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
                            height: 160,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 50,
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(5),
                                  title: Text(title[index],
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                  subtitle: SingleChildScrollView(
                                    child: Text(
                                      descripcion[index],
                                      style: TextStyle(
                                          fontSize: 9, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              // Usamos una fila para ordenar los botones del card
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  MaterialButton(
                                    height: 16,
                                    minWidth: 10,
                                    onPressed: () => {},
                                    child: Text(
                                      'Crea una cuenta',
                                      style: TextStyle(
                                          fontSize: 6, color: Colors.white),
                                    ),
                                    color: Color(0xFFF1f2e6f),
                                    shape: StadiumBorder(),
                                  ),
                                  SizedBox(width: 3),
                                  MaterialButton(
                                    height: 16,
                                    minWidth: 10,
                                    onPressed: () => {},
                                    child: Text(
                                      'Contacta a ventas',
                                      style: TextStyle(
                                          fontSize: 6, color: Colors.black),
                                    ),
                                    color: Colors.white,
                                    shape: StadiumBorder(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 3),
          Container(
            width: _screenSize.width * 0.8,
            alignment: Alignment.topLeft,
            child: SmoothPageIndicator(
              //animación Expanding Dots
              controller: controller,
              count: _imgList.length,
              effect: ExpandingDotsEffect(
                  expansionFactor: 3,
                  dotColor: Colors.white,
                  activeDotColor: Colors.white,
                  dotHeight: 6.0,
                  dotWidth: 6.0,
                  spacing: 3),
            ),
          ),
        ],
      ),
    );
  }
}
