import 'package:flutter/material.dart';
import 'package:inseel_app/controler/transactions_provider.dart';
import 'package:inseel_app/view/widgets/header_card.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final provider = Provider.of<TransactionsProvider>(context);
    final incomes = provider.getTotalIncomes();
    final expenses = provider.getTotalExpenses();
    final balance = provider.getBalance();

    return SizedBox(
      //height: 100,
      //width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Prueba Inseel App',
            style: textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Text(
            'Balance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            '\$ ${balance.toStringAsFixed(0)}',
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                HeaderCard(
                  title: 'Entradas',
                  amount: incomes.toStringAsFixed(0),
                  icon: const Icon(
                    Icons.arrow_circle_up_rounded,
                    color: Colors.green,
                  ),
                ),
                HeaderCard(
                  title: 'Salidas',
                  amount: expenses.toStringAsFixed(0),
                  icon: const Icon(
                    Icons.arrow_circle_down_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
