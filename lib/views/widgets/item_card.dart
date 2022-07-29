import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    Key? key,
    required this.product,
    this.isItemChacked = false,
    required this.press,
  }) : super(key: key);

  final Product product;
  final bool isItemChacked;
  final VoidCallback press;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: widget.press,
      child: Container(
        margin: const EdgeInsets.only(
          right: kDefaultPadding,
          bottom: kDefaultPadding,
        ),
        width: size.width * 0.4,
        child: Column(
          children: [
            Stack(
              children: [
                FadeInImage.assetNetwork(
                  placeholder: "assets/icons/spinner.gif",
                  image: widget.product.imgURL,
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ),
                if (widget.product.discountValue != null)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0, left: 3.0),
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 50,
                              color: Colors.red.withOpacity(0.4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "${widget.product.discountValue}%",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isCheck = isCheck == true ? false : true;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: isCheck
                            ? Colors.redAccent
                            : CupertinoColors.systemGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 3),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${widget.product.title}\n",
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        TextSpan(
                          text: widget.product.category.toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  if (widget.product.discountValue != null)
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\$${widget.product.price}\n",
                            style: Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          TextSpan(
                            text:
                                "\$${widget.product.price * widget.product.discountValue! / 100}",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                ?.copyWith(color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                  if (widget.product.discountValue == null)
                    Text(
                      "\$${widget.product.price}",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: kPrimaryColor),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
