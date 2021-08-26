import 'package:flutter/material.dart';
import 'package:prueba/ui/pages/login_home_page.dart';
import 'package:prueba/ui/pages/principal_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listo App',
      initialRoute: LoginHome.rutaLogin, // rutas con nombre
      routes: {
        LoginHome.rutaLogin: (BuildContext context) => LoginHome(),
        PrincipalHome.rutaPrincipal: (BuildContext contex) => PrincipalHome(),
      },
    );
  }
}
