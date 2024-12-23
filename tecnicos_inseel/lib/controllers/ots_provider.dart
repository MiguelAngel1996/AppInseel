import 'package:flutter/material.dart';
import 'package:tecnicos_inseel/models/ot.dart';

class OtsProvider extends ChangeNotifier {
    
  Ot nuevaOt = Ot(
    numeroOt: '',
    fechaInicio: '',
    horaInicio: '',
    cliente: '',
    sucursal: '',
    ciudad: '',
    motivo: '',
    diagnostico: '',
    trabajos: '',
    comentarios: '',
    tecnico1: '',
    tecnico2: '',
    fechaFin: '',
    horaFin: '',
    gastoReal: '',
    recibe: '',
    alturas: 'No',
    estado: 'Pendiente',
    materiales: {},
  );

  void actualizarNumeroOt(String nuevoNumeroOt) {
    nuevaOt.numeroOt = nuevoNumeroOt;
    notifyListeners();
  }

  void actualizarFechaInicio(String nuevoFechaInicio) {
    nuevaOt.fechaInicio = nuevoFechaInicio;
    notifyListeners();
  }

  void actualizarHoraInicio(String nuevoHoraInicio) {
    nuevaOt.horaInicio = nuevoHoraInicio;
    notifyListeners();
  }

  void actualizarCliente(String nuevoCliente) {
    nuevaOt.cliente = nuevoCliente;
    notifyListeners();
  }

  void actualizarSucursal(String nuevoSucursal) {
    nuevaOt.sucursal = nuevoSucursal;
    notifyListeners();
  }

  void actualizarCiudad(String nuevoCiudad) {
    nuevaOt.ciudad = nuevoCiudad;
    notifyListeners();
  }

  void actualizarMotivo(String nuevoMotivo) {
    nuevaOt.motivo = nuevoMotivo;
    notifyListeners();
  }

  void actualizarDiagnostico(String nuevoDiagnostico) {
    nuevaOt.diagnostico = nuevoDiagnostico;
    notifyListeners();
  }

  void actualizarTrabajos(String nuevoTrabajos) {
    nuevaOt.trabajos = nuevoTrabajos;
    notifyListeners();
  }

  void actualizarComentarios(String nuevoComentarios) {
    nuevaOt.comentarios = nuevoComentarios;
    notifyListeners();
  }

  void actualizarTecnico1(String nuevoTecnico1) {
    nuevaOt.tecnico1 = nuevoTecnico1;
    notifyListeners();
  }

  void actualizarTecnico2(String nuevoTecnico2) {
    nuevaOt.tecnico2 = nuevoTecnico2;
    notifyListeners();
  }

  void actualizarFechaFin(String nuevoFechaFin) {
    nuevaOt.fechaFin = nuevoFechaFin;
    notifyListeners();
  }

  void actualizarHoraFin(String nuevoHoraFin) {
    nuevaOt.horaFin = nuevoHoraFin;
    notifyListeners();
  }

  void actualizarGastoReal(String nuevoGastoReal) {
    nuevaOt.gastoReal = nuevoGastoReal;
    notifyListeners();
  }

  void actualizarRecibe(String nuevoRecibe) {
    nuevaOt.recibe = nuevoRecibe;
    notifyListeners();
  }

  void actualizarAlturas(String nuevoAlturas) {
    nuevaOt.alturas = nuevoAlturas;
    notifyListeners();
  }

  void actualizarEstado(String nuevoEstado) {
    nuevaOt.estado = nuevoEstado;
    notifyListeners();
  }

  void actualizarMateriales(Map<String,int> nuevoMateriales) {
    nuevaOt.materiales = nuevoMateriales;
    notifyListeners();
  }

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
      alturas: 'No',
      estado: 'Pendiente',
      materiales: {'Lamparas': 2, 'Tornillos': 4},
    ),
  ];

  List<Ot> get listasOt {
    return _listaOts;
  }


  void addOT() {
    _listaOts.add(nuevaOt);
    notifyListeners();
  }
}
