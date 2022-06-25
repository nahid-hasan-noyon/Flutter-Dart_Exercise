import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavorite = false,
  });

  final firebaseRDBLink = FlutterConfig.get('Firebase_RDB_link');

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final url = Uri.parse(
        '$firebaseRDBLink/user-favorites/$userId/$id.json?auth=$token');
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    try {
      final response = await http.put(
        url,
        body: json.encode(isFavorite),
      );
      if (response.statusCode >= 400) {
        isFavorite = oldStatus;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
