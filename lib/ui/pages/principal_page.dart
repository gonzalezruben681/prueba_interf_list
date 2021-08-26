import 'package:flutter/material.dart';
import 'package:prueba/ui/pages/login_home_page.dart';
import 'package:prueba/ui/widgets/principal/Draggable_scrollable_sheets.dart';
import 'package:prueba/ui/widgets/principal/sliderImagenes_principal.dart';

class PrincipalHome extends StatelessWidget {
  static final rutaPrincipal = 'principal';
  final String? pathImage;
  final String? text;

  PrincipalHome({this.pathImage, this.text});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          // para abrir el drawer con el menú
          builder: (context) {
            return _botonDrawerMenu(context);
          },
        ),
        title: Container(
          height: _screenSize.height * 0.15,
          width: _screenSize.width * 0.35,
          child: Image.asset('assets/img/logo_listo.PNG'),
        ),
        centerTitle: true,
        elevation: 13.0,
        toolbarHeight: _screenSize.height * 0.10,
        backgroundColor: Colors.white,
        actions: [_botonImprimir(_screenSize, context)],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [ImageSliderDemo(), BotonesPrincipal()],
            ),
          ),
          DraggableScrollableSheets()
        ],
      ),
      drawer: Drawer(
        child: _menuDrawer(_screenSize, context),
      ),
    );
  }

  Widget _menuDrawer(Size _screenSize, BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        _drawerHeaderMenu(_screenSize),
        _rutaActual(),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color(0xFF346c94),
          height: 10,
          indent: 40.0,
          endIndent: 40.0,
          thickness: 1.0,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              height: _screenSize.height * 0.06,
              width: 5,
              color: Color(0xFF346c94),
            ),
            Expanded(
              child: ListTile(
                leading: Image.asset(
                  'assets/img/página_principal.png',
                  fit: BoxFit.contain,
                ),
                title: Text(
                  'Inicio',
                  style: TextStyle(
                      color: Color(0xFF346c94),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushNamed(context, rutaPrincipal);
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        _listTileMenu(
            context, 'assets/img/enrutamiento.png', 'Enrutamiento crédito', ''),
        SizedBox(
          height: 5,
        ),
        _listTileMenu(
            context, 'assets/img/reportes.png', 'Consulta de reportes', ''),
        SizedBox(
          height: 5,
        ),
        _listTileMenu(context, 'assets/img/anulaciones.png', 'Anulaciones', ''),
        SizedBox(
          height: 5,
        ),
        _listTileMenu(context, 'assets/img/mensajes.png', 'Mensajes', ''),
        SizedBox(
          height: 5,
        ),
        _listTileMenu(context, 'assets/img/cambiarContraseña.png',
            'Cambiar contraseña', ''),
        SizedBox(
          height: 5,
        ),
        _listTileMenu(context, 'assets/img/cerrarSesion.png', 'Cerrar sesión',
            LoginHome.rutaLogin),
      ],
    );
  }

  Widget _rutaActual() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 2.0),
              child: Text(
                'Ruta actual',
                style: TextStyle(
                    color: Color(0xFF346c94),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            DropdownButtonHideUnderline(
                child: Container(
              height: 35.0,
              width: 250,
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
              child: DropdownButton(
                isExpanded: true,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                items: [
                  DropdownMenuItem(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '01 Gestión Cartera',
                    ),
                  ))
                ],
              ),
            )),
          ],
        ));
  }

  Widget _listTileMenu(
      BuildContext context, String imagen, String text, String ruta) {
    return ListTile(
      leading: Image.asset(
        imagen,
        fit: BoxFit.contain,
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Color(0xFF346c94),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
    );
  }

  Widget _drawerHeaderMenu(Size _screenSize) {
    return Container(
      height: _screenSize.height * 0.20,
      child: DrawerHeader(
        child: Container(
          child: Image.asset(
            'assets/img/logo_listo.PNG',
            fit: BoxFit.none,
          ),
        ),
        decoration: BoxDecoration(color: Color(0xFF346c94)),
      ),
    );
  }

  Widget _botonDrawerMenu(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.12,
      width: _screenSize.width * 0.12,
      margin: EdgeInsets.only(left: 10.0, top: 15.0, bottom: 15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 3))
          ]),
      child: IconButton(
        icon: Icon(
          Icons.menu,
          size: 40,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
        color: Color(0xFF346c94),
        padding: EdgeInsets.all(2),
      ),
    );
  }

  Widget _botonImprimir(Size _screenSize, BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Impresora desconectada",
                  style: TextStyle(color: Color(0xFF346c94)),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Configurar impresora",
                  style: TextStyle(
                      color: Color(0xFF346c94), fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ],
      child: Container(
        height: _screenSize.height * 0.12,
        width: _screenSize.width * 0.12,
        margin: EdgeInsets.only(right: 10.0, top: 15.0, bottom: 15.0),
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
        child: Icon(
          Icons.print,
          color: Color(0xFF346c94),
          size: 40,
        ),
      ),
      offset: Offset(0, 70),
    );
  }
}

class BotonesPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _crearBoton(_screenSize, 'Clientes', 'assets/img/clientes.png'),
              _crearBoton(_screenSize, 'Ventas', 'assets/img/ventas.png'),
              _crearBoton(_screenSize, 'Recaudo', 'assets/img/recaudo.png')
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _crearBoton(_screenSize, 'Recargas', 'assets/img/recargas.png'),
            _crearBoton(_screenSize, 'Rifas', 'assets/img/lottery.png'),
            _crearBoton(_screenSize, 'Tienda', 'assets/img/supermercado.png')
          ]),
        ],
      ),
    );
  }

  Widget _crearBoton(Size _screenSize, String text, String imagen) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4), // color de la sombra
                  spreadRadius: 1, // radio de extensión
                  blurRadius: 5, // radio de desenfoque
                  offset: Offset(1, 3),
                )
              ]),
          height: _screenSize.height * 0.10,
          width: _screenSize.width * 0.20,
          child: MaterialButton(
            onPressed: () {},
            child: Image.asset(
              imagen,
              height: 55,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(text,
            style: TextStyle(
                color: Color(0xFF346c94),
                fontSize: 15,
                fontWeight: FontWeight.bold))
      ],
    );
  }
}
