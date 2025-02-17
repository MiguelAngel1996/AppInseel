import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';

class AgregarMateriales extends StatefulWidget {
  const AgregarMateriales({super.key});

  @override
  State<AgregarMateriales> createState() => _AgregarMaterialesState();
}

class _AgregarMaterialesState extends State<AgregarMateriales> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtsProvider>(context);
    //final nuevaOt = provider.nuevaOt;
    String item = '';
    String cantidad = '';
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Form(
          key: _globalFormKey,
          child: Column(
            children: [
              Container(
                height: 6,
                width: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(3)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Nuevo Material',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo Obligatorio';
                  }
                  return null;
                },
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onSecondary,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 20.0,
                  ), // Padding interno del TextFormField
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
                  item = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Cantidad',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Obligatorio';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onSecondary,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20.0,
                    ), // Padding interno del TextFormField
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
                    cantidad = value;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  if (_globalFormKey.currentState!.validate()) {
                    provider.actualizarMateriales({item: cantidad});
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Argregar',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
