import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/pages/informacion_cierre.dart';

class AlturasPendiente extends StatefulWidget {
  const AlturasPendiente({super.key});

  @override
  State<AlturasPendiente> createState() => _AlturasPendienteState();
}

class _AlturasPendienteState extends State<AlturasPendiente> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtsProvider>(context);
    final nuevaOt = provider.nuevaOt;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Altura personalizada
        child: AppBar(
          backgroundColor: Colors.transparent, // Fondo transparente
          elevation: 0, // Sin sombra
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary, // Fondo blanco
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                '¿Es un trabajo de alturas?',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                //height: 400, // Altura personalizada para el TextField
                padding: const EdgeInsets.all(16), // Espaciado interno
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface, // Fondo similar al diseño
                  borderRadius: BorderRadius.circular(30), // Bordes redondeados
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Botón para "Sí"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: nuevaOt.alturas == 'Si'
                            ? Colors.orange
                            : Colors.grey.shade300, // Color activo/inactivo
                        foregroundColor: nuevaOt.alturas == 'Si'
                            ? Colors.white
                            : Colors.black, // Color del texto
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          nuevaOt.alturas =
                              'Si'; // Marca "Sí" como seleccionado
                        });
                      },
                      child: const Text('Sí'),
                    ),

                    // Botón para "No"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: nuevaOt.alturas == 'No'
                            ? Colors.orange
                            : Colors.grey.shade300, // Color activo/inactivo
                        foregroundColor: nuevaOt.alturas == 'No'
                            ? Colors.white
                            : Colors.black, // Color del texto
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            nuevaOt.alturas =
                                'No'; // Marca "No" como seleccionado
                          },
                        );
                      },
                      child: const Text('No'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary, // Fondo blanco
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                '¿Cuál es el estado del trabajo?',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                //height: 400, // Altura personalizada para el TextField
                padding: const EdgeInsets.all(16), // Espaciado interno
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface, // Fondo similar al diseño
                  borderRadius: BorderRadius.circular(30), // Bordes redondeados
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Botón para "Sí"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: nuevaOt.estado == 'Terminado'
                            ? Colors.orange
                            : Colors.grey.shade300, // Color activo/inactivo
                        foregroundColor: nuevaOt.estado == 'Terminado'
                            ? Colors.white
                            : Colors.black, // Color del texto
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          nuevaOt.estado =
                              'Terminado'; // Marca "Terminado" como seleccionado
                        });
                      },
                      child: const Text('Terminado'),
                    ),

                    // Botón para "No"
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: nuevaOt.estado == 'Pendiente'
                            ? Colors.orange
                            : Colors.grey.shade300, // Color activo/inactivo
                        foregroundColor: nuevaOt.estado == 'Pendiente'
                            ? Colors.white
                            : Colors.black, // Color del texto
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          nuevaOt.estado =
                              'Pendiente'; // Marca "Pendiente" como seleccionado
                        });
                      },
                      child: const Text('Pendiente'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const InformacionCierre()));
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_sharp),
      ),
    );
  }
}
