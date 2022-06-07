import 'package:flutter/material.dart';

class BuildUserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  BuildUserProductItem(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        trailing: Container(
          width: 100,
          child: Row(children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              color: Colors.grey,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Colors.red,
            )
          ]),
        ),
      ),
    );
  }
}
