import 'package:flutter/material.dart';
import 'package:multi_store/pages/custom_home_page.dart';

class CartPage extends StatelessWidget {
  static const String routeName = 'cart-page';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Cart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_forever_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Cart Is Empty!',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(CustomHomePage.routeName);
              },
              child: const Text('Start Shopping'),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const Text(
              'Total: \$',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Text(
              '00.00',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Check Out',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
