import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/models/product.dart';
import 'package:e_commerce_complete_app/views/pages/Home/components/title_with_more_button.dart';
import 'package:e_commerce_complete_app/views/widgets/item_card.dart';
import 'package:flutter/material.dart';

import 'components/top_title_and_image.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
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
              // ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   itemCount: getProducts.length,
              //   itemBuilder: (context, index) =>
              ItemCard(product: getProducts[0]),
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
