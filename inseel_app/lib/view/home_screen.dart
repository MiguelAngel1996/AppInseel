import 'package:flutter/material.dart';
import 'package:inseel_app/view/components/add_transaction.dart';
import 'package:inseel_app/view/components/home_body.dart';
import 'package:inseel_app/view/components/home_footer.dart';
import 'package:inseel_app/view/components/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2811D),
      body: const SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            HomeBody(),
            //FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
            //HomeFooter(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddTransaction();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
