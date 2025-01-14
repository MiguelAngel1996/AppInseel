import 'dart:typed_data';
class Ot {
  String numeroOt;
  String fechaInicio;
  String horaInicio;
  String cliente;
  String sucursal;
  String ciudad;
  String motivo;
  String diagnostico;
  String trabajos;
  String comentarios;
  String tecnico1;
  String tecnico2;
  String fechaFin;
  String horaFin;
  String gastoReal;
  String recibe;
  String alturas;
  String estado;
  Map<String, String> materiales;
  Uint8List firma;
  String numeroCelular;
  String correo;

  Ot({
    required this.numeroOt,
    required this.fechaInicio,
    required this.horaInicio,
    required this.cliente,
    required this.sucursal,
    required this.ciudad,
    required this.motivo,
    required this.diagnostico,
    required this.trabajos,
    required this.comentarios,
    required this.tecnico1,
    required this.tecnico2,
    required this.fechaFin,
    required this.horaFin,
    required this.gastoReal,
    required this.recibe,
    required this.alturas,
    required this.estado,
    required this.materiales,
    required this.firma,
    required this.numeroCelular,
    required this.correo,
  });

}
