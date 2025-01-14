import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';

class Firma extends StatefulWidget {
  const Firma({super.key});

  @override
  State<Firma> createState() => _FirmaState();
}

class _FirmaState extends State<Firma> {
  final SignatureController _firmaController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void dispose() {
    _firmaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OtsProvider>(context);
    final nuevaOt = provider.nuevaOt;
    return Scaffold(
      appBar: AppBar(
        title: Text('Firma de Recibido'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Signature(
              controller: _firmaController,
              backgroundColor: Colors.grey[200]!,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _firmaController.clear();
                },
                child: Text('Borrar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_firmaController.isNotEmpty) {
                    final signature = await _firmaController.toPngBytes();
                    if (signature != null) {
                      // Aquí puedes guardar la firma o usarla según sea necesario
                      
                      nuevaOt.firma = signature;
                      Navigator.pop(context, true);
                      
                    }
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
