import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/models/product.dart';
import 'package:e_commerce_complete_app/views/pages/Home/components/title_with_more_button.dart';
import 'package:e_commerce_complete_app/views/widgets/item_card.dart';
import 'package:flutter/material.dart';

import 'components/top_title_and_image.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isItemChecked = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          const TopTitleAndImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                const SizedBox(height: kDefaultPadding),
                TitleWithMoreButton(
                  title: "Sale",
                  description: "Suer summer sale!",
                  press: () {},
                ),
                const SizedBox(height: kDefaultPadding),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      getProducts.length,
                      (index) => ItemCard(
                        product: getProducts[index],
                        isItemChacked: isItemChecked,
                        press: () {
                          setState(() {
                            isItemChecked =
                                isItemChecked == true ? false : true;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                TitleWithMoreButton(
                  title: "New",
                  description: "Super New Items!",
                  press: () {},
                ),
                const SizedBox(height: kDefaultPadding),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      getProducts.length,
                      (int index) => ItemCard(
                        product: getProducts[4 - index],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
