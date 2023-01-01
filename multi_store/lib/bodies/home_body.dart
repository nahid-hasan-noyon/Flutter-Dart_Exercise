import 'package:flutter/material.dart';
import 'package:multi_store/pages/search_page.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          title: InkWell(
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
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.yellow,
            indicatorWeight: 5,
            isScrollable: true,
            tabs: [
              HomeBodyTab(tabLabel: 'Men'),
              HomeBodyTab(tabLabel: 'Women'),
              HomeBodyTab(tabLabel: 'Shoes'),
              HomeBodyTab(tabLabel: 'Bags'),
              HomeBodyTab(tabLabel: 'Electronics'),
              HomeBodyTab(tabLabel: 'Accessories'),
              HomeBodyTab(tabLabel: 'Home & Garden'),
              HomeBodyTab(tabLabel: 'Kids'),
              HomeBodyTab(tabLabel: 'Beauty'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Men'),
            ),
            Center(
              child: Text('Women'),
            ),
            Center(
              child: Text('Shoes'),
            ),
            Center(
              child: Text('Bags'),
            ),
            Center(
              child: Text('Electronics'),
            ),
            Center(
              child: Text('Accessories'),
            ),
            Center(
              child: Text('Home & Garden'),
            ),
            Center(
              child: Text('Kids'),
            ),
            Center(
              child: Text('Beauty'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBodyTab extends StatelessWidget {
  final String tabLabel;
  const HomeBodyTab({
    Key? key,
    required this.tabLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        tabLabel,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
