import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartCLientes extends StatefulWidget {
  static final rutaPrueba = 'prueba';
  PieChartCLientes({Key? key}) : super(key: key);

  @override
  _PieChartCLientesState createState() => _PieChartCLientesState();
}

class _PieChartCLientesState extends State<PieChartCLientes> {
  List<PieChartSectionData> _sections = [];
  double? valor;
  String? title;
  var valoresGrafica = [5.0, 20.0, 11.0];

  @override
  void initState() {
    super.initState();

    PieChartSectionData _item = PieChartSectionData(
        color: Color(0xff0c5cb4),
        value: valoresGrafica[0],
        showTitle: false,
        radius: 7);
    PieChartSectionData _item2 = PieChartSectionData(
        color: Color(0xfffcb04c),
        value: valoresGrafica[1],
        showTitle: false,
        radius: 5);
    PieChartSectionData _item3 = PieChartSectionData(
        color: Color(0xffbc1626),
        value: valoresGrafica[1],
        showTitle: false,
        radius: 5);

    _sections = [_item, _item2, _item3];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: PieChart(
            PieChartData(
              startDegreeOffset: 180, // para girar la grafica
              sections: _sections, // el contenido de la grafica
              centerSpaceRadius: 15,
              sectionsSpace: 3,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                valoresGrafica[0].toInt().toString(),
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xff0c5cb4),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                valoresGrafica[1].toInt().toString(),
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xfffcb04c),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                valoresGrafica[2].toInt().toString(),
                style: TextStyle(
                    fontSize: 11,
                    color: Color(0xffbc1626),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          flex: -1,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Clientes nuevos',
                  style: TextStyle(fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Cantidad clientes',
                  style: TextStyle(fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Clientes visitados',
                  style: TextStyle(fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
