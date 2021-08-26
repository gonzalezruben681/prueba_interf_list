import 'package:flutter/material.dart';
import 'package:prueba/ui/pages/principal_page.dart';

class CajaFormulario extends StatelessWidget {
  const CajaFormulario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.0), // separacion del container
      padding: EdgeInsets.symmetric(
          vertical: 5.0), //separacion del inicio del texto y al final del mismo
      width: _screenSize.width * 0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 2.0,
              offset: Offset(2.0, 2.0),
              spreadRadius: 2.0)
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _crearEmail(),
            SizedBox(height: 10.0),
            _crearPassword(),
            SizedBox(height: 10.0),
            _crearBoton(context)
          ],
        ),
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Correo electrónico o número de celular: ',
            style: TextStyle(color: Color(0xFF346c94)),
          ),
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 20.0),
            //margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  offset: Offset(1.0, 3.0),
                )
              ],
            ),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  border: InputBorder.none // para quitar el borde
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0), // relleno
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contraseña: ', style: TextStyle(color: Color(0xFF346c94))),
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  offset: Offset(1.0, 3.0),
                )
              ],
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                border: InputBorder.none,
              ),
              // OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: _screenSize.width * 0.10,
      child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xFF346c94),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            onPressed: () {
              Navigator.pushNamed(context, PrincipalHome.rutaPrincipal);
            },
            child: Text(
              "Iniciar sesión",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            textColor: Colors.white,
          )),
    );
  }
}
