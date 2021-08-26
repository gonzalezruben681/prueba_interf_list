import 'dart:convert';
import 'package:flutter/material.dart';

ListaCreditos listaCreditofromJsonList(String strCredito) =>
    ListaCreditos.fromJsonList(json.decode(strCredito));

class ListaCreditos {
  List<ListaCredito> items = [];

  ListaCreditos();

  ListaCreditos.fromJsonList(List<dynamic>? jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      final credito = ListaCredito.fromJson(item);
      items.add(credito);
    });
  }
}

class ListaCredito {
  String? imagenPath;
  Color? colorBordecard;
  String? nombre;
  String? telefono;
  String? valorCuota;
  String? valorCredito;

  ListaCredito(
      {this.nombre,
      this.telefono,
      this.valorCuota,
      this.valorCredito,
      this.imagenPath,
      this.colorBordecard});

  ListaCredito.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    telefono = json['telefono'];
    colorBordecard = json['color_bordecard'];
    imagenPath = json['imagen_path'];
    valorCredito = json['valor_credito'];
    valorCuota = json['valor_cuota'];
  }
}
