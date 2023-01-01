import 'package:flutter/material.dart';

import '../pages/search_page.dart';

class FakeSearchWidget extends StatelessWidget {
  const FakeSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(SearchPage.routeName);
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.yellow,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 1,
            ),
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            const Text(
              'What are you looking for?',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 32,
              width: 75,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(25)),
            )
          ],
        ),
      ),
    );
  }
}
