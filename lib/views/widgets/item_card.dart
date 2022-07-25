import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/models/product.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.6,
                    offset: const Offset(0, 10),
                    color: kPrimaryColor.withOpacity(0.05),
                  ),
                  BoxShadow(
                    blurRadius: 1.6,
                    offset: const Offset(-10, 10),
                    color: kPrimaryColor.withOpacity(0.05),
                  ),
                ],
              ),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/icons/spinner.gif",
                image: product.imgURL,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 25,
                width: 35,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      "${product.discountValue}%",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          product.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );

    /*SizedBox(
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  product.imgURL,
                  fit: BoxFit.cover,
                  height: 100,
                  width: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );*/
  }
}
