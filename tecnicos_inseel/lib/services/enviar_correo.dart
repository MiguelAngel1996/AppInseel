import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:tecnicos_inseel/models/ot.dart';

Future<void> enviarCorreo(Ot ordenTrabajo, String filePath) async {
  String username = 'planeacionproyectos@inseelsas.com';
  String password =
      'Pl@neacion*1ns33l'; // Usa contraseñas de aplicaciones si usas Gmail.

  // Configura el servidor SMTP
  final smtpServer = SmtpServer(
    'mail.inseelsas.com', // Cambia por el servidor SMTP real.
    port: 465, // Cambia al puerto correcto si es necesario.
    username: username,
    password: password,
    ssl: true, // Cambia a true si el servidor usa SSL.
    allowInsecure: false, // Asegúrate de que sea seguro.
  );

  // Crea el mensaje
  final message = Message()
    ..from = Address(username, 'INSEEL SAS')
    ..recipients.addAll([
      ordenTrabajo.correo,
      'planeacionproyectos@inseelsas.com'
    ]) // Agrega destinatarios
    ..subject = 'Orden de trabajo realizada #${ordenTrabajo.numeroOt}'
    ..text =
        'Cordial saludo, Adjuntamos orden de trabajo de la actividad realizada. La orden de trabajo fue firmada y recibida con código de verificacion enviada a +57${ordenTrabajo.numeroCelular}Cualquier observación referente al servicio favor comunicarse por este medio. ¡Gracias por confiar en nosotros!'
    ..html =
        '<html lang="es"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Orden de Trabajo</title></head><body><p>Cordial saludo,</p><p>Adjuntamos orden de trabajo de la actividad realizada.</p><p>La orden de trabajo fue firmada y recibida con código de verificacion enviada a +57${ordenTrabajo.numeroCelular}.</p><p>Cualquier observación referente al servicio favor comunicarse por este medio.</p><p>¡Gracias por confiar en nosotros!</p></body></html>'
    ..attachments.add(FileAttachment(File(filePath))
      ..fileName = '${ordenTrabajo.fechaInicio} ${ordenTrabajo.motivo}');

  /*   final message = Message()
    ..from = Address(username, 'Tu Nombre o Departamento')
    ..recipients.add('destinatario@otraempresa.com') // Cambia por el destinatario.
    ..ccRecipients.add('otro@tuempresa.com')        // Opcional: Copias.
    ..bccRecipients.add('oculto@tuempresa.com')     // Opcional: Copias ocultas.
    ..subject = 'Asunto del correo'
    ..text = 'Este es un mensaje de texto plano.'
    ..html = '<h1>Este es un mensaje en HTML</h1>'; */

  try {
    final sendReport = await send(message, smtpServer);
    print('Correo enviado: ${sendReport.toString()}');
  } on MailerException catch (e) {
    print('Error al enviar correo: $e');
    for (var p in e.problems) {
      print('Problema: ${p.code}: ${p.msg}');
    }
  }
}
