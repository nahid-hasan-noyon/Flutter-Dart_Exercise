import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_complete_guide/screens/product_detail_screen.dart';
import 'package:flutter_complete_guide/screens/products_overview_screen.dart';
import 'package:flutter_complete_guide/providers/products_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProductsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
        },
      ),
    );
  }
}
