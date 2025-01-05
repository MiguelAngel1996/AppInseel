import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> generateAndSharePdf(Uint8List imageBytes, String fileName) async {
  final pdf = pw.Document();

  // Agregar la imagen al PDF
  final image = pw.MemoryImage(imageBytes);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4.copyWith(
      marginLeft: 0,
      marginRight: 0,
      marginTop: 0,
      marginBottom: 0,
    ), // Tamaño estándar A4
      build: (pw.Context context) => pw.Center(
        child: pw.Image(image),
      ),
    ),
  );

  // Guardar el PDF en el almacenamiento local
  final output = await getTemporaryDirectory();
final file = File("${output.path}\\$fileName.pdf");
  await file.writeAsBytes(await pdf.save());
  //print(file.path);
  // Compartir el PDF
  await Share.shareXFiles([XFile(file.path)], text: 'Mira este PDF generado con Flutter!');
}

//captura lo que se ve en pantalla
Future<Uint8List> captureWidgetToImage(GlobalKey key) async {
  try {
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;

    // Obtener la imagen del widget
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  } catch (e) {
    throw Exception("Error al capturar el widget: $e");
  }
}

//captura todo el contenido
Future<Uint8List> captureFullContent(GlobalKey key) async {
  try {
    // Encuentra el RenderRepaintBoundary
    final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;

    // Calcula el tamaño completo del contenido desplazable
    //final size = boundary.size;
    //print('Tamaño del contenido: $size');

    // Renderiza el contenido completo
    final image = await boundary.toImage(pixelRatio: 3.0); // Ajusta el pixelRatio si es necesario
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData!.buffer.asUint8List();
  } catch (e) {
    print('Error al capturar contenido: $e');
    rethrow;
  }
}

