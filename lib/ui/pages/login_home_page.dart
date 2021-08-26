import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba/ui/widgets/login/caja_formulario_login.dart';
import 'package:prueba/ui/widgets/login/footer_slider_Card_login.dart';
import 'package:prueba/ui/widgets/login/slider_imagenes_superior_login.dart';

class LoginHome extends StatelessWidget {
  static final rutaLogin = 'loginHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // para correciones de dimensiones inferiores
      appBar: AppBar(
        title: Container(
          height: 100.0,
          width: 150.0,
          child: Image.asset('assets/img/logo_listo.PNG'),
        ),
        centerTitle: true, // centrado
        elevation: 13.0, // sombra
        toolbarHeight: 80.0, // altura de la appbar
        backgroundColor: Colors.white,
        actions: [_BotonAccionesAppBar()],
        actionsIconTheme: IconThemeData(
            color: Color(0xFF346c94),
            size: 36.0), // cambia el color del icono a verde y el tamaño
      ),
      body: SingleChildScrollView(
          child:
              _Login()), // sirve para los errores de Fondo desbordado por n píxeles
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: _Footer(),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderImagenes(),
        CajaFormulario(),
        FooterSliderYCard(),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
        height: _screenSize.height * 0.06,
        color: Color(0xFF346c94),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 30,
                height: 30,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Color(0xFF346c94),
                  child: FaIcon(
                    FontAwesomeIcons.facebookF,
                    size: 24,
                  ),
                  padding: EdgeInsets.all(5),
                  shape: CircleBorder(),
                )),
            SizedBox(width: 10.0),
            Container(
                width: 30,
                height: 30,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Color(0xFF346c94),
                  child: FaIcon(
                    FontAwesomeIcons.twitter,
                    size: 15,
                  ),
                  padding: EdgeInsets.all(5),
                  shape: CircleBorder(),
                )),
            SizedBox(width: 10.0),
            Container(
                width: 30,
                height: 30,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Color(0xFF346c94),
                  child: FaIcon(
                    FontAwesomeIcons.instagram,
                    size: 20,
                  ),
                  padding: EdgeInsets.all(5),
                  shape: CircleBorder(),
                )),
          ],
        ));
  }
}

class _BotonAccionesAppBar extends StatelessWidget {
  const _BotonAccionesAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
        height: _screenSize.height * 0.12,
        width: _screenSize.width * 0.12,
        margin: EdgeInsets.only(right: 20.0, top: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4), // color de la sombra
                spreadRadius: 1, // radio de extensión
                blurRadius: 5, // radio de desenfoque
                offset: Offset(1, 3), // cambia la posición de la sombra
                // el primer parámetro de desplazamiento es de izquierda a derecha
                //// el segundo parámetro es de arriba hacia abajo
              ),
            ]),
        child: MaterialButton(
          onPressed: () {
            dialog(context);
          },
          textColor: Color(0xFF346c94),
          child: Icon(Icons.more_vert, size: 40),
          padding: EdgeInsets.all(2),
        ));
  }

  Future<String?> dialog(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => Center(
            child: Container(
                // A simplified version of dialog.
                height: _screenSize.width * 0.55,
                width: _screenSize.width * 0.90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      width: _screenSize.width * 0.90,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Configuración de conexión',
                                style: TextStyle(
                                    color: Color(0xFF346c94),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.symmetric(horizontal: 20.0),
                              //margin: EdgeInsets.symmetric(horizontal: 20.0),
                              height: _screenSize.height * 0.05,
                              width: _screenSize.width * 0.70,

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 2.0,
                                    offset: Offset(1.0, 3.0),
                                  )
                                ],
                              ),
                              child: Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                child: TextField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 40.0, top: 6.0, bottom: 9.0),
                                    border: InputBorder.none,
                                    hintText:
                                        'Ingresa la clave', // para quitar el borde
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              height: _screenSize.height * 0.04,
                              width: _screenSize.width * 0.40,
                              child: OutlinedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  side: BorderSide(
                                      width: 1.0, color: Color(0xFF346c94)),
                                ),
                                onPressed: () {
                                  dialogDatosConexion(context, _screenSize);
                                },
                                child: Text(
                                  "Aceptar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color(0xFF346c94),
                                  ),
                                ),
                              ),
                            )
                          ])),
                )))));
  }

  Future<dynamic> dialogDatosConexion(BuildContext context, Size _screenSize) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Center(
          child: Text(
            'Datos de conexión',
            style: TextStyle(
                color: Color(0xFF346c94),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        contentPadding:
            EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 20.0),
                //margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: _screenSize.height * 0.05,
                width: _screenSize.width * 0.70,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2.0,
                      offset: Offset(1.0, 3.0),
                    )
                  ],
                ),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 40.0, top: 6.0, bottom: 9.0),
                    border: InputBorder.none,
                    hintText: 'Ip', // para quitar el borde
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 20.0),
                //margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: _screenSize.height * 0.05,
                width: _screenSize.width * 0.70,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2.0,
                      offset: Offset(1.0, 3.0),
                    )
                  ],
                ),
                child: TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 40.0, top: 6.0, bottom: 9.0),
                    border: InputBorder.none,
                    hintText: 'Puerto', // para quitar el borde
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: _screenSize.height * 0.04,
                width: _screenSize.width * 0.40,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(width: 1.0, color: Color(0xFF346c94)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Guardar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF346c94),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
