import 'package:flutter/material.dart';
import 'package:tecnicos_inseel/models/ot.dart';

class OtsProvider extends ChangeNotifier {
  final List<Ot> _listaOts = [
    Ot(
      numeroOt: '0001',
      fechaInicio: '01/02/2024',
      horaInicio: '14:00',
      cliente: 'Terpel',
      sucursal: 'El cable',
      ciudad: 'Manizales',
      motivo: 'Daño luces',
      diagnostico: 'Lamparas dañadas',
      trabajos: 'Cambio de lamparas',
      comentarios: 'Se realizó el cambio de lamparas',
      tecnico1: 'Miguel',
      tecnico2: 'Angel',
      fechaFin: '02/02/2024',
      horaFin: '15:45',
      gastoReal: '3 horas',
      recibe: 'Andres',
      alturas: true,
      estado: true,
      materiales: {'Lamparas': 2, 'Tornillos': 4},
    ),
    Ot(
      numeroOt: '0002',
      fechaInicio: '23/06/2024',
      horaInicio: '10:00',
      cliente: 'Terpel',
      sucursal: 'Neira',
      ciudad: 'Neira',
      motivo: 'Daño desagüe',
      diagnostico: 'sifón dañado',
      trabajos: 'Cambio de rejilla',
      comentarios: 'Se realizó el cambio de rejilla',
      tecnico1: 'jeaky',
      tecnico2: 'jeis',
      fechaFin: '02/12/2024',
      horaFin: '16:20',
      gastoReal: '5 horas',
      recibe: 'Felipe',
      alturas: true,
      estado: true,
      materiales: {'Rejillas': 1, 'masilla': 1},
    )
  ];

  List<Ot> get listasOt{
    return _listaOts;
  }

  void addOT(Ot ot){
    _listaOts.add(ot);
    notifyListeners();
  }
}
