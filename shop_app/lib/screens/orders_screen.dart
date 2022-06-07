import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/orders.dart';
import 'package:flutter_complete_guide/widgets/build_drawer.dart';
import 'package:flutter_complete_guide/widgets/build_order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        automaticallyImplyLeading: true,
      ),
      drawer: BuildDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) =>
            BuildOrderItem(orderData.orders[index]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
