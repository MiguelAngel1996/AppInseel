import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/pages/materiales.dart';

class TrabajosRealizados extends StatefulWidget {
  const TrabajosRealizados({super.key});

  @override
  State<TrabajosRealizados> createState() => _TrabajosRealizadosState();
}

class _TrabajosRealizadosState extends State<TrabajosRealizados> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Trabajos Realizados',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Página 4 de 9',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Form(
          key: _globalFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    height: 400, // Altura personalizada para el TextField
                    padding: const EdgeInsets.all(16), // Espaciado interno
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary, // Fondo similar al diseño
                      borderRadius:
                          BorderRadius.circular(30), // Bordes redondeados
                    ),
                    child: TextFormField(
                      autofocus: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo Obligatorio';
                        }
                        return null;
                      },
                      maxLength: 500,
                      maxLines: null, // Permite múltiples líneas dinámicas
                      //expands: true, // Ocupa todo el espacio disponible
                      textAlignVertical:
                          TextAlignVertical.top, // Alineación superior
                      decoration: const InputDecoration(
                        border: InputBorder.none, // Sin bordes predeterminados
                      ),
                      onChanged: (value) {
                        nuevaOt.trabajos = value
                            .replaceAll('\n', ' -')
                            .replaceAll(RegExp(r'\s+'), ' ')
                            .trim();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_globalFormKey.currentState!.validate()) {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 600),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const Materiales(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(
                      1.0, 0.0); // Empieza fuera de la pantalla (derecha)
                  const end = Offset.zero; // Termina en su posición normal
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          }
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_sharp),
      ),
    );
  }
}
