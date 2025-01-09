import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/components/vista_ot.dart';
import 'package:tecnicos_inseel/views/pages/home.dart';

class InformacionCierre extends StatefulWidget {
  const InformacionCierre({super.key});

  @override
  State<InformacionCierre> createState() => _InformacionCierreState();
}

class _InformacionCierreState extends State<InformacionCierre> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtsProvider>(context);
    final nuevaOt = provider.nuevaOt;
    final listasOt = provider.listasOt;
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
                'Información de Cierre',
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
                      'Técnico 1:',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLength: 30,
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
                        nuevaOt.tecnico1 = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Técnico 2:',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLength: 30,
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
                        nuevaOt.tecnico2 = value;
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
                              'Fecha finalización:',
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
                                  nuevaOt.fechaFin = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hora finalización:',
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
                                  nuevaOt.horaFin = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Gasto Real:',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLength: 15,
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
                        nuevaOt.gastoReal = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Quien recibe el servicio:',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLength: 30,
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
                        nuevaOt.recibe = value;
                      },
                    ),
                    //const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () {
                            provider.addOT();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VistaOt(ot: listasOt[0]),
                              ),
                            );
                          },
                          child: Text(
                            'Terminar',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
