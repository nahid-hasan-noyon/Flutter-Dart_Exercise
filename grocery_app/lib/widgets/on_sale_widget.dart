import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/price_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            // todo add action
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://i.ibb.co/F0s3FHQ/Apricots.png',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.width * 0.22,
                  ),
                  Column(
                    children: [
                      const Text('1KG'),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // todo add action
                            },
                            child: const Icon(
                              MdiIcons.cartOutline,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // todo add action
                            },
                            child: const Icon(
                              MdiIcons.heartOutline,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const PriceWidget(),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Product Name',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
