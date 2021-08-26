import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CpCreditos extends StatelessWidget {
  final String? texto;
  final double? valor;
  final Color? colors;
  final double? startAngle;
  final int? creditos;

  CpCreditos(
      {this.texto, this.valor, this.colors, this.startAngle, this.creditos});

  @override
  Widget build(BuildContext context) {
    final resp = (valor! / 100);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularPercentIndicator(
          startAngle: startAngle!,
          radius: 55.0,
          lineWidth: 5.0,
          percent: resp,
          center: Text(
            '${valor!.toInt().toString()}%',
            style: TextStyle(fontSize: 11),
          ),
          progressColor: colors,
        ),
        Text(
          creditos.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: colors),
        ),
        Text(
          texto!,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
