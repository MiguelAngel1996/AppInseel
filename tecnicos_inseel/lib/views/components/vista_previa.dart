import 'package:flutter/material.dart';

class VistaPrevia extends StatelessWidget {
  final double scale;
  final double top;
  final double left;
  final String dato;

  const VistaPrevia({
    super.key,
    required this.scale,
    required this.top,
    required this.left,
    required this.dato,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // Coordenadas relativas a la imagen escalada
      top: top * scale,
      left: left * scale,
      child: Text(
        dato, // Reemplaza con ot.numeroOt
        style: TextStyle(
          fontSize: 20 * scale,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
