import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.catTitle,
    required this.passedColor,
    required this.imgPath,
  }) : super(key: key);

  final String catTitle;
  final Color passedColor;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // todo navigate to another page
      },
      child: Container(
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: passedColor.withOpacity(0.7),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              catTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
