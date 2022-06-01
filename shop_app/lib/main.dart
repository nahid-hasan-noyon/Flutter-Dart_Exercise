import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/product_detail_screen.dart';
import 'package:flutter_complete_guide/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ProductOverviewScreen.routeName,
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
      },
    );
  }
}
