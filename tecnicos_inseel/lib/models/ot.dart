class Ot {
  final String numeroOt;
  final String fechaInicio;
  final String horaInicio;
  final String cliente;
  final String sucursal;
  final String ciudad;
  final String motivo;
  final String diagnostico;
  final String trabajos;
  final String comentarios;  
  final String tecnico1;
  final String tecnico2;
  final String fechaFin;
  final String horaFin;
  final String gastoReal;
  final String recibe;
  final bool alturas;
  final bool estado;
  final Map<String, int> materiales;

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
  });
}
