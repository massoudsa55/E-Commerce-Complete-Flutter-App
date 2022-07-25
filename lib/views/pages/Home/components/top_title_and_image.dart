import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/utilities/assets.dart';
import 'package:flutter/material.dart';

class TopTitleAndImage extends StatelessWidget {
  const TopTitleAndImage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        FadeInImage.assetNetwork(
          placeholder: "assets/icons/ripple.gif",
          image: AppAssets.topBannerHomePageAsset,
          width: double.infinity,
          height: size.height * 0.3,
          fit: BoxFit.cover,
        ),
        Opacity(
          opacity: 0.3,
          child: Container(
              width: double.infinity,
              height: size.height * 0.3,
              color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding,
          ),
          child: Text(
            "Street Clothes",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
