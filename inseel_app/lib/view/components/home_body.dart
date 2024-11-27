import 'package:flutter/material.dart';
import 'package:inseel_app/controler/transactions_provider.dart';
import 'package:inseel_app/model/transaction.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions =
        Provider.of<TransactionsProvider>(context).transactions;

    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, int index) {
            final transaction = transactions[index];
            final type = transaction.type == TransactionType.income
                ? 'Entrada'
                : 'Salida';
            final icono = transaction.type == TransactionType.income
                ? const Icon(
                    Icons.arrow_circle_up_rounded,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.arrow_circle_down_rounded,
                    color: Colors.red,
                  );
            final color = transaction.type == TransactionType.income
                ? Colors.green
                : Colors.red;
            final value = transaction.type == TransactionType.income
                ? '\$ ${transaction.amount.toStringAsFixed(0)}'
                : '-\$ ${transaction.amount.abs().toStringAsFixed(0)}';
            return ListTile(
              leading: icono,
              title: Text(transaction.description),
              subtitle: Text(type),
              trailing: Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: color,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
