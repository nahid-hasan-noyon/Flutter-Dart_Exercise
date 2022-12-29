import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/widgets/heart_btn_widget.dart';
import 'package:grocery_app/widgets/price_widget.dart';

class FeedItemWidget extends StatefulWidget {
  const FeedItemWidget({super.key});

  @override
  State<FeedItemWidget> createState() => _FeedItemWidgetState();
}

class _FeedItemWidgetState extends State<FeedItemWidget> {
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantityTextController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          // todo add action
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg',
              height: MediaQuery.of(context).size.width * 0.2,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HeartBTNWidget(),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 25,
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PriceWidget(),
                  const Spacer(),
                  const FittedBox(
                    child: Text(
                      'KG',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: TextFormField(
                      cursorHeight: 5,
                      key: const ValueKey('10'),
                      controller: _quantityTextController,
                      style: const TextStyle(fontSize: 18),
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      enabled: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp('[0-9.]'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  //todo add action
                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
