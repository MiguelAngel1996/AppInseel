import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/models/ot.dart';
import 'package:tecnicos_inseel/services/compartir_pdf.dart';
import 'package:tecnicos_inseel/views/components/vista_previa.dart';

final GlobalKey _captureKey = GlobalKey();

class VistaOt extends StatelessWidget {
  final Ot ot;
  const VistaOt({super.key, required this.ot});

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, String>> pares = ot.materiales.entries
        .toList(); //asegura una lista de 10 items para visualizar en tabla de materiales sin error
    while (pares.length < 10) {
      pares.add(const MapEntry('', ''));
    }
    //final provider = Provider.of<OtsProvider>(context);
    //final listasOt = provider.listasOt;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Altura personalizada
        child: AppBar(
          backgroundColor: Colors.transparent, // Fondo transparente
          elevation: 0, // Sin sombra
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary, // Fondo blanco
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                'O.T. #: ${ot.numeroOt}',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          RepaintBoundary(
            key: _captureKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return FutureBuilder<Size>(
                            future: _getImageSize('assets/images/OT_INSEEL.jpg'),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CircularProgressIndicator(); // Mientras se cargan las dimensiones
                              }
            
                              final imageSize = snapshot.data!;
                              final containerWidth = constraints.maxWidth;
                              final containerHeight = constraints.maxHeight;
            
                              // Calcular escala de la imagen
                              final scaleWidth = containerWidth / imageSize.width;
                              final scaleHeight =
                                  containerHeight / imageSize.height;
                              final scale = scaleWidth < scaleHeight
                                  ? scaleWidth
                                  : scaleHeight;
            
                              final scaledWidth = imageSize.width * scale;
                              final scaledHeight = imageSize.height * scale;
            
                              return SizedBox(
                                width: scaledWidth,
                                height: scaledHeight,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/OT_INSEEL.jpg',
                                      fit: BoxFit.fitWidth,
                                      width: scaledWidth,
                                      height: scaledHeight,
                                    ),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.20,
                                        lineas:1,
                                        scale: scale,
                                        top: 183,
                                        left: 890,
                                        dato: ot.numeroOt),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.20,
                                        lineas:1,
                                        scale: scale,
                                        top: 210,
                                        left: 890,
                                        dato: ot.fechaInicio),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.20,
                                        lineas:1,
                                        scale: scale,
                                        top: 237,
                                        left: 890,
                                        dato: ot.horaInicio),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.20,
                                        lineas:1,
                                        scale: scale,
                                        top: 265,
                                        left: 890,
                                        dato: ot.cliente),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.20,
                                        lineas:1,
                                        scale: scale,
                                        top: 293,
                                        left: 890,
                                        dato: ot.sucursal),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.20,
                                        lineas:1,
                                        scale: scale,
                                        top: 320,
                                        left: 890,
                                        dato: ot.ciudad),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.85,
                                        lineas:2,
                                        scale: scale,
                                        top: 376,
                                        left: 80,
                                        dato: ot.motivo),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.85,
                                        lineas:2,
                                        scale: scale,
                                        top: 460,
                                        left: 80,
                                        dato: ot.diagnostico),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.85,
                                        lineas:7,
                                        scale: scale,
                                        top: 542,
                                        left: 80,
                                        dato: ot.trabajos),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.85,
                                        lineas:8,
                                        scale: scale,
                                        top: 978,
                                        left: 80,
                                        dato: ot.comentarios),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.25,
                                        lineas:1,
                                        scale: scale,
                                        top: 1313,
                                        left: 800,
                                        dato: ot.tecnico1),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.25,
                                        lineas:1,
                                        scale: scale,
                                        top: 1353,
                                        left: 800,
                                        dato: ot.tecnico2),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.25,
                                        lineas:1,
                                        scale: scale,
                                        top: 1393,
                                        left: 800,
                                        dato: ot.fechaFin),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.25,
                                        lineas:1,
                                        scale: scale,
                                        top: 1429,
                                        left: 800,
                                        dato: ot.horaFin),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.25,
                                        lineas:1,
                                        scale: scale,
                                        top: 1468,
                                        left: 800,
                                        dato: ot.gastoReal),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.25,
                                        lineas:1,
                                        scale: scale,
                                        top: 1332,
                                        left: 230,
                                        dato: ot.recibe),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.85,
                                        lineas:1,
                                        scale: scale,
                                        top: 1220,
                                        left: 1000,
                                        dato: ot.alturas),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.85,
                                        lineas:1,
                                        scale: scale,
                                        top: 1220,
                                        left: 440,
                                        dato: ot.estado),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 813,
                                        left: 90,
                                        dato: pares[0].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 813,
                                        left: 210,
                                        dato: pares[0].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 839,
                                        left: 90,
                                        dato: pares[1].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 839,
                                        left: 210,
                                        dato: pares[1].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 867,
                                        left: 90,
                                        dato: pares[2].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 867,
                                        left: 210,
                                        dato: pares[2].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 894,
                                        left: 90,
                                        dato: pares[3].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 894,
                                        left: 210,
                                        dato: pares[3].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 921,
                                        left: 90,
                                        dato: pares[4].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 921,
                                        left: 210,
                                        dato: pares[4].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 813,
                                        left: 640,
                                        dato: pares[5].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 813,
                                        left: 780,
                                        dato: pares[5].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 839,
                                        left: 640,
                                        dato: pares[6].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 839,
                                        left: 780,
                                        dato: pares[6].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 867,
                                        left: 640,
                                        dato: pares[7].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 867,
                                        left: 780,
                                        dato: pares[7].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 894,
                                        left: 640,
                                        dato: pares[8].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 894,
                                        left: 780,
                                        dato: pares[8].key),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.1,
                                        lineas:1,
                                        scale: scale,
                                        top: 921,
                                        left: 640,
                                        dato: pares[9].value),
                                    VistaPrevia(
                                        ancho: containerWidth * 0.3,
                                        lineas:1,
                                        scale: scale,
                                        top: 921,
                                        left: 780,
                                        dato: pares[9].key),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Capturar el widget como imagen
          //final imageBytes = await captureWidgetToImage(_captureKey);//captura lo que se ve en pantalla
          final imageBytes =
              await captureFullContent(_captureKey); //captura todo el contenido

          // Generar y compartir el PDF
          await generateAndSharePdf(imageBytes, '${ot.fechaInicio} - ${ot.numeroOt} - ${ot.sucursal} - ${ot.motivo}');
        },
        tooltip: 'Compartir',
        child: const Icon(Icons.share),
      ),
    );
  }
}

Future<Size> _getImageSize(String assetPath) async {
  final image = AssetImage(assetPath);
  final completer = Completer<Size>();

  image.resolve(const ImageConfiguration()).addListener(
    ImageStreamListener((ImageInfo info, bool _) {
      final size = Size(
        info.image.width.toDouble(),
        info.image.height.toDouble(),
      );
      completer.complete(size);
    }),
  );

  return completer.future;
}
