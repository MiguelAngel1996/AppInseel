import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inseel_app/controler/transactions_provider.dart';
import 'package:inseel_app/model/transaction.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  int? typeIdex = 0;
  TransactionType type = TransactionType.income;
  double amount = 0;
  String description = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 550,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 50,
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(3),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Nueva Transacción',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CupertinoSlidingSegmentedControl(
              groupValue: typeIdex,
              backgroundColor: Colors.grey.shade400,
              thumbColor: Colors.orange.shade300,
              children: const {
                0: Text('Entrada'),
                1: Text('Salida'),
              },
              onValueChanged: (value) {
                setState(() {
                  typeIdex = value;
                  type = value == 0
                      ? TransactionType.income
                      : TransactionType.expense;
                  amount = type == TransactionType.income?amount:-amount;
                });
              }),
          const SizedBox(height: 15),
          Text(
            'Monto',
            style: textTheme.bodySmall!.copyWith(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          TextField(
            inputFormatters: [
              CurrencyTextInputFormatter.currency(
                symbol: '\$',
                decimalDigits: 0,
              )
            ],
            decoration: InputDecoration.collapsed(
                hintText: '\$0',
                hintStyle: TextStyle(color: Colors.grey.shade400)),
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(),
            autofocus: true,
            onChanged: (value) {
              final valuewithdollarsign = value.replaceAll('\$', '');
              final valuewithcomas = valuewithdollarsign.replaceAll(',', '');
              if (valuewithcomas.isNotEmpty) {
                amount = double.parse(valuewithcomas);
                amount = type == TransactionType.income?amount:-amount;
              }
            },
          ),
          const SizedBox(height: 15),
          Text(
            'Descripción',
            style: textTheme.bodySmall!.copyWith(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          TextField(
            decoration: InputDecoration.collapsed(
                hintText: 'Opcional',
                hintStyle: TextStyle(color: Colors.grey.shade400)),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              description = value;
            },
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                final transaction = Transaction(
                  type: type,
                  description: description,
                  amount: amount,
                );

                Provider.of<TransactionsProvider>(context, listen: false)
                    .addTransaction(transaction);

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade300),
              child: const Text(
                'Guardar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
