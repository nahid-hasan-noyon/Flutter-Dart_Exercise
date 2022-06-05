import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/build_cart_item.dart';
import 'package:flutter_complete_guide/providers/cart_items_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Chip(
                    label: Text('\$${cart.totalAmount}'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Order Now'),
                  ),
                ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: ((context, index) => BuildCartItem(
                  cart.items.values.toList()[index].id,
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].quantity,
                  cart.items.values.toList()[index].title,
                )),
            itemCount: cart.itemCount,
          ),
        )
      ]),
    );
  }
}
