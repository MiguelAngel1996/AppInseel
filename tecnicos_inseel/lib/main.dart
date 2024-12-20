import 'package:flutter/material.dart';
import 'package:tecnicos_inseel/controllers/ots_provider.dart';
import 'package:tecnicos_inseel/views/pages/home.dart';
import 'package:provider/provider.dart';


void main() {
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
            onSurface: Color(0xff595959)
            ),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
