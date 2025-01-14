import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/components/agregar_materiales.dart';
import 'package:tecnicos_inseel/views/pages/comentarios.dart';

class Materiales extends StatefulWidget {
  const Materiales({super.key});

  @override
  State<Materiales> createState() => _MaterialesState();
}

class _MaterialesState extends State<Materiales> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtsProvider>(context);
    final nuevaOt = provider.nuevaOt;
    List<MapEntry<String, String>> listaMateriales =
        nuevaOt.materiales.entries.toList();
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
                    'Materiales utilizados',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Página 5 de 9',
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: listaMateriales.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                              leading: Text(
                                listaMateriales[index].value,
                                style: const TextStyle(fontSize: 15),
                              ),
                              title: Text(listaMateriales[index].key),
                              //subtitle: Text(listaMateriales[index].value),
                              trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    nuevaOt.materiales
                                        .remove(listaMateriales[index].key);
                                  });
                                },
                                icon: Icon(Icons.delete),
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      sheetAnimationStyle: AnimationStyle(
                        duration: Duration(milliseconds: 700),
                        reverseDuration: Duration(milliseconds: 700),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const AgregarMateriales();
                      },
                    );
                  },
                  child: const Text(
                    'Argregar',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (nuevaOt.materiales.isNotEmpty) {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 600),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const Comentarios(),
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
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alerta'),
                  content: Text(
                      'Para evitar espacios en blanco,\nFavor diligenciar un item como "No Aplica"'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Cierra el dialogo
                      },
                      child: Text('Cerrar'),
                    ),
                  ],
                );
              },
            );
          }
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_sharp),
      ),
    );
  }
}
