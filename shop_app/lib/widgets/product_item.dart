import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_complete_guide/providers/product.dart';
import 'package:flutter_complete_guide/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // String id;
  // String title;
  // String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      //? gives border radius to any widget
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        header: GridTileBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text(product.title),
          ),
        ),
        //? create each grid tile for grid view but can be used without gridView.
        child: GestureDetector(
          //? precepts anything on its inside widget.
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onDoubleTap: () {
            product.toggleFavoriteStatus();
          },
        ),
        footer: GridTileBar(
          leading: IconButton(
            color: Colors.redAccent,
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),
          //? creates bar for a grid tile.
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: Icon(
            (Icons.shopping_bag_outlined),
          ),
        ),
      ),
    );
  }
}
