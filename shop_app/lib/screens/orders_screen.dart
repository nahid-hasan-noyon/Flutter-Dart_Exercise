import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/orders.dart';
import 'package:flutter_complete_guide/widgets/build_drawer.dart';
import 'package:flutter_complete_guide/widgets/build_order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';
  const OrdersScreen({key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Future _ordersFuture;
  Future _obtainOrderFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrderFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        automaticallyImplyLeading: true,
      ),
      drawer: BuildDrawer(),
      body: FutureBuilder(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.error != null) {
                return Center(
                  child: Text('An error occurred!'),
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      BuildOrderItem(orderData.orders[index]),
                  itemCount: orderData.orders.length,
                );
              }
            }
          }),
    );
  }
}
