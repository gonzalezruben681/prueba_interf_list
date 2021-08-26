import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prueba/models/lista_credito_model.dart';
import 'package:prueba/ui/widgets/principal/cp_indicator_creditos.dart';
import 'package:prueba/ui/widgets/principal/pie_chart_clientes.dart';
import 'package:prueba/providers/listo_provider.dart';
import 'package:prueba/ui/widgets/principal/pie_chart_creditos_cobrar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DraggableScrollableSheets extends StatefulWidget {
  @override
  _DraggableScrollableSheetsState createState() =>
      _DraggableScrollableSheetsState();
}

class _DraggableScrollableSheetsState extends State<DraggableScrollableSheets> {
  _DraggableScrollableSheetsState();

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        SlidingUpPanel(
          maxHeight: _screenSize.height * 0.53,
          minHeight: 300,
          panelBuilder: (sc) => _panelGraficas(context, _screenSize, sc),
          color: Color(0xFF346c94),
          parallaxEnabled: true,
          parallaxOffset: 0.5,
        ),
        SlidingUpPanel(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
          maxHeight: 450,
          minHeight: 120,
          panelBuilder: (sc) => _panelListaCredito(context, _screenSize, sc),
          parallaxEnabled: true,
          parallaxOffset: 0.5,
        ),
      ],
    );
  }

  Widget _panelGraficas(
    BuildContext context,
    Size _screenSize,
    ScrollController sc,
  ) {
    final _graficasSuperior = MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                      // 1
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      child: Container(
                        width: _screenSize.height * 0.5,
                        height: _screenSize.width * 0.15,
                        child: Center(child: PieChartCreditosCobrar()),
                      )),
                  Card(
                    // 2
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    child: Container(
                      width: _screenSize.height * 0.5,
                      height: _screenSize.width * 0.15,
                      child: Center(child: PieChartCLientes()),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    // 1
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    child: Container(
                      width: _screenSize.height * 0.10,
                      height: _screenSize.width * 0.33,
                      child: CpCreditos(
                        valor: 75,
                        texto: 'Créditos visitados',
                        colors: Color(0xff0b4070),
                        startAngle: 90,
                        creditos: 18,
                      ),
                    ),
                  ),
                  Card(
                    // 2
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                    child: Container(
                      width: _screenSize.height * 0.10,
                      height: _screenSize.width * 0.33,
                      child: CpCreditos(
                        valor: 48,
                        texto: 'Créditos abonados',
                        colors: Color(0xff1160b6),
                        startAngle: 190,
                        creditos: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    final _graficasInferior = Container(
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Card(
                child: Container(
                  width: _screenSize.height * 0.20,
                  height: _screenSize.width * 0.25,
                  child: Center(child: Text('D1')),
                ),
              ),
            ),
            Expanded(
              child: Card(
                child: Container(
                  width: _screenSize.height * 0.20,
                  height: _screenSize.width * 0.25,
                  child: Center(child: Text('D2')),
                ),
              ),
            )
          ]),
    );

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        // removeBottom: true,

        child: ListView(
          controller: sc,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10),
              child: Text(
                'Estadisticas de hoy Lunes 7 de Julio',
                style: TextStyle(color: Colors.white),
              ),
            ),
            _graficasSuperior,
            _graficasInferior,
          ],
        ));
  }

  Widget _panelListaCredito(
      BuildContext context, Size screenSize, ScrollController sc) {
    List<ListaCredito> listaCreditos = [];

    ListoProvider.datos.forEach((item) {
      final credito = new ListaCredito.fromJson(item);
      listaCreditos.add(credito);
    });

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 170),
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                    color: Color(0xFF346c94),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Lista crédito',
                    style: TextStyle(
                        color: Color(0xFF346c94),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'ver todo',
                        style: TextStyle(color: Color(0xFF346c94)),
                      ))
                ],
              ),
            ),
            Container(
              height: 400,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(top: 2.0),
              width: double.infinity,
              // color: Colors.redAccent,
              child: _ListaCredito(listaCreditos: listaCreditos),
            )
          ],
        ));
  }
}

class _ListaCredito extends StatelessWidget {
  final List<ListaCredito> listaCreditos;

  const _ListaCredito({required this.listaCreditos});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaCreditos.length,
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side:
                      BorderSide(color: listaCreditos[index].colorBordecard!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        listaCreditos[index].imagenPath!,
                        alignment: Alignment.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xfffcfcfc),
                        border: Border.all(
                            color: listaCreditos[index].colorBordecard!),
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 10), //(right: 10.0, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listaCreditos[index].nombre!,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF346c94),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            listaCreditos[index].telefono!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF346c94),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), //(right: 10.0, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('valor cuota ',
                                  style: TextStyle(fontSize: 10)),
                              Text(listaCreditos[index].valorCuota!)
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Saldo crédito ',
                                  style: TextStyle(fontSize: 10)),
                              Text(
                                listaCreditos[index].valorCredito!,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
