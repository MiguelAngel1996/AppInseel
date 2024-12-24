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
    final List<MapEntry<String, String>> listaMateriales =
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
              child: Text(
                'Materiales utilizados',
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
                            title: Text(listaMateriales[index].key),
                            //subtitle: Text(listaMateriales[index].value),
                            trailing: Text(
                              listaMateriales[index].value,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Comentarios()));
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_sharp),
      ),
    );
  }
}
