import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prueba/models/lista_credito_model.dart';

class ListoProvider {
  static final datos = [
    {
      'color_bordecard': Colors.yellow,
      'imagen_path': 'assets/img/precaucion.png',
      'nombre': 'ruben',
      'telefono': '+56-109-27544',
      'valor_credito': '\$30,000',
      'valor_cuota': '\$300,000'
    },
    {
      'color_bordecard': Colors.red,
      'imagen_path': 'assets/img/advertencia.png',
      'nombre': 'josefa',
      'telefono': '+56-109-27544',
      'valor_credito': '\$30,000',
      'valor_cuota': '\$300,000'
    },
    {
      'color_bordecard': Colors.green,
      'imagen_path': 'assets/img/me-gusta.png',
      'nombre': 'karla',
      'telefono': '+56-109-27544',
      'valor_credito': '\$30,000',
      'valor_cuota': '\$300,000'
    },
    {
      'color_bordecard': Colors.yellow,
      'imagen_path': 'assets/img/precaucion.png',
      'nombre': 'miguel',
      'telefono': '+56-109-27544',
      'valor_credito': '\$30,000',
      'valor_cuota': '\$300,000'
    },
    {
      'color_bordecard': Colors.green,
      'imagen_path': 'assets/img/me-gusta.png',
      'nombre': 'miguel',
      'telefono': '+56-109-27544',
      'valor_credito': '\$30,000',
      'valor_cuota': '\$300,000'
    }
  ];
  //final decodedData = listaCreditofromJsonList(datos.toString());
}
