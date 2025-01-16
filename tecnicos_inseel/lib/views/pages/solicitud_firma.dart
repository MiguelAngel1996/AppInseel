import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/components/firma.dart';
import 'package:tecnicos_inseel/views/components/vista_ot.dart';

class SolicitudFirma extends StatefulWidget {
  const SolicitudFirma({super.key});

  @override
  State<SolicitudFirma> createState() => _SolicitudFirmaState();
}

class _SolicitudFirmaState extends State<SolicitudFirma> {
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Solicitud Firma',
                    style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Página 9 de 9',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Número Celular:',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Permitir solo números
                          LengthLimitingTextInputFormatter(
                              10), // Limitar a 10 caracteres
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese un número de teléfono';
                          } else if (value.length != 10) {
                            return 'El número ingresado no es válido';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorMaxLines: 2,
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
                          nuevaOt.numeroCelular = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Correo Cliente:',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingrese un correo electrónico';
                          } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                              .hasMatch(value)) {
                            return 'Ingrese un correo electrónico válido';
                          }
                          return null;
                        },
                        maxLength: 50,
                        decoration: InputDecoration(
                          errorMaxLines: 2,
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
                          nuevaOt.correo = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Firma Cliente:',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSecondary),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: SizedBox(
                          width: double.infinity,
                          child: Container(
                            height:
                                200, // Altura personalizada para el TextField
                            padding:
                                const EdgeInsets.all(16), // Espaciado interno
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary, // Fondo similar al diseño
                              borderRadius: BorderRadius.circular(
                                  30), // Bordes redondeados
                            ),
                            child: nuevaOt.firma.isNotEmpty
                                ? Image.memory(nuevaOt.firma)
                                : SizedBox(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          final bool refrescar = await Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 600),
                              reverseTransitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      Firma(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0,
                                    0.0); // Empieza fuera de la pantalla (derecha)
                                const end = Offset
                                    .zero; // Termina en su posición normal
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
                          if (refrescar) {
                            setState(() {});
                          }
                          FocusScope.of(context).unfocus();
                        },
                        child: Text(
                          'Firmar',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          if (_globalFormKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Alerta'),
                                  content:
                                      Text('¿Está seguro de finalizar la OT?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Cierra el dialogo
                                      },
                                      child: Text('Cerrar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        provider.addOT();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VistaOt(
                                                ot: listasOt[0], index: 0),
                                          ),
                                        );
                                      },
                                      child: Text('Aceptar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          'Terminar',
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
            ],
          ),
        ),
      ),
    );
  }
}
