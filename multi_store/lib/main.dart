import 'package:flutter/material.dart';
import 'package:multi_store/pages/customer_home_page.dart';
import 'package:multi_store/pages/search_page.dart';

import 'pages/cart_page.dart';
import 'pages/profile_page.dart';
import 'pages/stores_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomerHomePage(),
      routes: {
        CustomerHomePage.routeName: (context) => const CustomerHomePage(),
        SearchPage.routeName: (context) => const SearchPage(),
        StoresPage.routeName: (context) => const StoresPage(),
        CartPage.routeName: (context) => const CartPage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
      },
    );
  }
}
