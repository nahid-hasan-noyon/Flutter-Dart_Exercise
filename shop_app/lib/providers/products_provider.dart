import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_complete_guide/models/http_exception.dart';

import 'package:flutter_complete_guide/providers/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];
  String authToken;
  String userId;

  void assignTokenAndUserId(String token, String id) {
    authToken = token;
    userId = id;
    notifyListeners();
  }

// * getter for all items
  List<Product> get items {
    return [..._items];
  }

  // * getter for favorite products
  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    var url = Uri.parse(
        'https://shop-app-d68a8-default-rtdb.firebaseio.com/products.json?auth=$authToken&$filterString');
    // try {
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    url = Uri.parse(
        'https://shop-app-d68a8-default-rtdb.firebaseio.com/user-favorites/$userId.json?auth=$authToken');
    final favoriteResponse = await http.get(url);
    final favoriteData = json.decode(favoriteResponse.body);

    final List<Product> loadedProducts = [];
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((prodId, prodData) {
      loadedProducts.add(
        Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          imageUrl: prodData['imageUrl'],
          isFavorite: favoriteData == null
              ? false
              : favoriteData[prodId] ?? false, //? ?? checks if its null or not
        ),
      );
    });
    _items = loadedProducts;
    notifyListeners();
    // } catch (error) {
    //   throw error;
    // }
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        'https://shop-app-d68a8-default-rtdb.firebaseio.com/products.json?auth=$authToken');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'imageUrl': product.imageUrl,
            'price': product.price,
            'creatorId': userId,
          },
        ),
      );

      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          'https://shop-app-d68a8-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken');
      await http.patch(
        url,
        body: json.encode(
          {
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          },
        ),
      );
      _items[prodIndex] = newProduct;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = Uri.parse(
        'https://shop-app-d68a8-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
