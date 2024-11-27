import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: const Color(0xFF595959),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.other_houses_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.wallet_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.add_circle_outline_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.file_copy_rounded,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
