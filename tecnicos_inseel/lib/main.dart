import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const TecnicosInseel());
}

class TecnicosInseel extends StatelessWidget {
  const TecnicosInseel({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tecnicos Inseel',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            errorStyle: TextStyle(
              fontSize: 16, // Tamaño de la letra
              fontWeight: FontWeight.bold, // Negrita
              color: Colors.red, // Color del texto de error
            ),
          ),
          fontFamily: 'oxanium',
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xff595959),
              onPrimary: Color(0xfff2f2f2),
              secondary: Color(0xfff2811d),
              onSecondary: Color(0xfff2f2f2),
              error: Colors.red,
              onError: Colors.white,
              surface: Color.fromARGB(255, 255, 197, 126),
              onSurface: Color(0xff595959)),
          useMaterial3: true,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('es', 'ES'), // Español
        ],
        locale: Locale('es', 'ES'), // Establece español como predeterminado
        home: const Home(),
      ),
    );
  }
}
