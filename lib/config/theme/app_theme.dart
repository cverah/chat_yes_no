//para el tema

import 'package:flutter/material.dart';

//color customized
const Color customColor = Color(0xFF49149F);

// lista de colores
const List<Color> colorsTheme = [
  customColor,
  Colors.black,
  Colors.yellow,
  Colors.orange,
  Colors.purpleAccent,
  Colors.greenAccent,
  Colors.brown,
];

class AppTheme {
  // atributos
  final int selectedColor;

  //inicialización de constructor al instanciar
  //valor de assert tiene que ser true sino mandara el error del mensaje
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < colorsTheme.length,
            "el numero tiene que estar entre 0 y 6");

  //constructor
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorsTheme[selectedColor],
      //aplicar tema oscuro
      //brightness: Brightness.dark
    );
  }
}
