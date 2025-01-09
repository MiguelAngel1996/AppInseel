import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/pages/motivo_servicio.dart';

class InformacionInicial extends StatefulWidget {
  const InformacionInicial({super.key});

  @override
  State<InformacionInicial> createState() => _InformacionInicialState();
}

class _InformacionInicialState extends State<InformacionInicial> {
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
                    'Información Inicial',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Página 1 de 8',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'O.T. #:',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLength: 10,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onSecondary,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ), // Padding interno del TextField
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Bordes redondeados
                          borderSide: BorderSide.none, // Sin borde
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary, // Borde al enfocarse
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        nuevaOt.numeroOt = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fecha inicio:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextField(
                                maxLength: 10,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 20.0,
                                  ), // Padding interno del TextField
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Bordes redondeados
                                    borderSide: BorderSide.none, // Sin borde
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary, // Borde al enfocarse
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  nuevaOt.fechaInicio = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hora inicio:',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TextField(
                                maxLength: 10,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.onSecondary,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                    horizontal: 20.0,
                                  ), // Padding interno del TextField
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Bordes redondeados
                                    borderSide: BorderSide.none, // Sin borde
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary, // Borde al enfocarse
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  nuevaOt.horaInicio = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Cliente:',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLength: 20,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onSecondary,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ), // Padding interno del TextField
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Bordes redondeados
                          borderSide: BorderSide.none, // Sin borde
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary, // Borde al enfocarse
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        nuevaOt.cliente = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Sucursal:',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLength: 20,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onSecondary,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ), // Padding interno del TextField
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Bordes redondeados
                          borderSide: BorderSide.none, // Sin borde
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary, // Borde al enfocarse
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        nuevaOt.sucursal = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Ciudad:',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLength: 20,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.onSecondary,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 20.0,
                        ), // Padding interno del TextField
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(30), // Bordes redondeados
                          borderSide: BorderSide.none, // Sin borde
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary, // Borde al enfocarse
                            width: 2.0,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        nuevaOt.ciudad = value;
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => const MotivoServicio()));
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 600),
              reverseTransitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const MotivoServicio(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin =
                    Offset(1.0, 0.0); // Empieza fuera de la pantalla (derecha)
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
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_sharp),
      ),
    );
  }
}
