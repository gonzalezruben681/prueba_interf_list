import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartCreditosCobrar extends StatefulWidget {
  static final rutaPrueba = 'prueba';
  PieChartCreditosCobrar({Key? key}) : super(key: key);

  @override
  _PieChartCreditosCobrarState createState() => _PieChartCreditosCobrarState();
}

class _PieChartCreditosCobrarState extends State<PieChartCreditosCobrar> {
  List<PieChartSectionData> _sections = [];
  double? valor;
  String? title;

  var valoresGrafica = [30.0, 30.0];

  @override
  void initState() {
    super.initState();

    PieChartSectionData _item = PieChartSectionData(
        color: Color(0xffe4eae7),
        value: valoresGrafica[0],
        showTitle: false,
        radius: 5);

    PieChartSectionData _item2 = PieChartSectionData(
        color: Color(0xff64a41c),
        value: valoresGrafica[1],
        showTitle: false,
        radius: 6);

    _sections = [_item, _item2];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Stack(children: [
            PieChart(
              PieChartData(
                startDegreeOffset: 270, // para girar la grafica
                sections: _sections, // el contenido de la grafica
                centerSpaceRadius: 15,
                sectionsSpace: 3,
              ),
            ),
            Center(
              child: Text(
                valoresGrafica[1].toInt().toString(),
                style: TextStyle(
                  color: Color(0xff64a41c),
                  fontSize: 11,
                ),
              ),
            ),
          ]),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '\$25,756',
                      style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff64a41c),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Meta recaudo o',
                      style: TextStyle(fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  'Creditos a cobrar',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
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
