import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/feed_item_widget.dart';
import 'package:grocery_app/widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Image.network(
                      'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg',
                      fit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                    ),
                  ),
                  control: const SwiperControl(),
                ),
              ),
              TextButton(
                onPressed: () {
                  // todo add action
                },
                child: const Text('View all'),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: Row(
                      children: const [
                        Text(
                          'On Sale',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.percent_outlined,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const OnSaleWidget();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Our products',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // todo add action
                      },
                      child: const Text(
                        "Browse all",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * 0.6),
                  children: List.generate(
                    4,
                    (index) => const FeedItemWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
