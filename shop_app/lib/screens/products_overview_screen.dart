import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = '/product-overview';

//* Dummy products

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: ProductsGrid(),
    );
  }
}
