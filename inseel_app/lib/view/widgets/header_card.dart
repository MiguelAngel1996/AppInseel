import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final String title;
  final String amount;
  final Widget icon;

  const HeaderCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  icon,
                  Text(title),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '\$$amount',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
