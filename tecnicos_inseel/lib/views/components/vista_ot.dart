import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/models/ot.dart';
import 'package:tecnicos_inseel/views/components/vista_previa.dart';

class VistaOt extends StatelessWidget {
  final Ot ot;
  const VistaOt({super.key, required this.ot});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
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
                  final scaleHeight = containerHeight / imageSize.height;
                  final scale =
                      scaleWidth < scaleHeight ? scaleWidth : scaleHeight;

                  final scaledWidth = imageSize.width * scale;
                  final scaledHeight = imageSize.height * scale;

                  return SizedBox(
                    width: scaledWidth,
                    height: scaledHeight,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/OT_INSEEL.jpg',
                          fit: BoxFit.contain,
                          width: scaledWidth,
                          height: scaledHeight,
                        ),
                        VistaPrevia(
                            scale: scale,
                            top: 183,
                            left: 890,
                            dato: ot.numeroOt),
                        VistaPrevia(
                            scale: scale,
                            top: 210,
                            left: 890,
                            dato: ot.fechaInicio),
                        VistaPrevia(
                            scale: scale,
                            top: 237,
                            left: 890,
                            dato: ot.horaInicio),
                        VistaPrevia(
                            scale: scale,
                            top: 265,
                            left: 890,
                            dato: ot.cliente),
                        VistaPrevia(
                            scale: scale,
                            top: 293,
                            left: 890,
                            dato: ot.sucursal),
                        VistaPrevia(
                            scale: scale,
                            top: 320,
                            left: 890,
                            dato: ot.ciudad),
                        VistaPrevia(
                            scale: scale,
                            top: 380,
                            left: 80,
                            dato: ot.motivo),
                        VistaPrevia(
                            scale: scale,
                            top: 460,
                            left: 80,
                            dato: ot.diagnostico),
                        VistaPrevia(
                            scale: scale,
                            top: 542,
                            left: 80,
                            dato: ot.trabajos),
                        VistaPrevia(
                            scale: scale,
                            top: 978,
                            left: 80,
                            dato: ot.comentarios),
                        VistaPrevia(
                            scale: scale,
                            top: 1310,
                            left: 800,
                            dato: ot.tecnico1),
                        VistaPrevia(
                            scale: scale,
                            top: 1350,
                            left: 800,
                            dato: ot.tecnico2),
                        VistaPrevia(
                            scale: scale,
                            top: 1393,
                            left: 800,
                            dato: ot.fechaFin),
                        VistaPrevia(
                            scale: scale,
                            top: 1429,
                            left: 800,
                            dato: ot.horaFin),
                        VistaPrevia(
                            scale: scale,
                            top: 1468,
                            left: 800,
                            dato: ot.gastoReal),
                        VistaPrevia(
                            scale: scale,
                            top: 1335,
                            left: 230,
                            dato: ot.recibe),
                        VistaPrevia(
                            scale: scale,
                            top: 1220,
                            left: 1000,
                            dato: ot.alturas),
                        VistaPrevia(
                            scale: scale,
                            top: 1220,
                            left: 440,
                            dato: ot.estado),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
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
}
