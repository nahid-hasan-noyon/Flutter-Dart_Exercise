import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/providers/cart_item.dart';

class OrderItem {
  String id;
  double amount;
  List<CartItem> products;
  DateTime dateTime;

  OrderItem({
    this.id,
    this.products,
    this.amount,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
