import 'package:flutter/material.dart';
import 'package:inseel_app/controler/transactions_provider.dart';
import 'package:inseel_app/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TransactionsProvider(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
