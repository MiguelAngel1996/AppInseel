import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/components/vista_ot.dart';
import 'package:tecnicos_inseel/views/pages/informacion_inicial.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtsProvider>(context);
    final listasOt = provider.listasOt;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80), // Altura personalizada
        child: AppBar(
          automaticallyImplyLeading: false,
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
                'Técnicos INSEEL',
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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.down,
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      //physics: BouncingScrollPhysics(),
                      itemCount: listasOt.length,
                      itemBuilder: (context, index) {
                        // Construcción invertida
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onSecondary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListTile(
                              title: Text(listasOt[index].motivo),
                              subtitle: Text(listasOt[index].fechaInicio),
                              trailing: Text(listasOt[index].numeroOt),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VistaOt(ot: listasOt[index]),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
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
          provider.limpiarOt();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const InformacionInicial()));
        },
        tooltip: 'Nueva Orden',
        child: const Icon(Icons.add),
      ),
    );
  }
}
