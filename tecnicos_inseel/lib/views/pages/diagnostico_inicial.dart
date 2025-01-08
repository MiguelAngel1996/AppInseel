import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/pages/trabajos_realizados.dart';

class DiagnosticoInicial extends StatefulWidget {
  const DiagnosticoInicial({super.key});

  @override
  State<DiagnosticoInicial> createState() => _DiagnosticoInicialState();
}

class _DiagnosticoInicialState extends State<DiagnosticoInicial> {
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
                'Diagnóstico inicial',
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
                  child: TextField(
                    maxLength: 100,
                    maxLines: null,// Permite múltiples líneas dinámicas
                    //expands: true, // Ocupa todo el espacio disponible
                    textAlignVertical:
                        TextAlignVertical.top, // Alineación superior
                    decoration: const InputDecoration(
                      border: InputBorder.none, // Sin bordes predeterminados
                    ),
                    onChanged: (value) {
                      nuevaOt.diagnostico = value.replaceAll('\n', ' -').replaceAll(RegExp(r'\s+'), ' ').trim();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TrabajosRealizados()));
        },
        tooltip: 'Siguiente',
        child: const Icon(Icons.arrow_forward_sharp),
      ),
    );
  }
}
