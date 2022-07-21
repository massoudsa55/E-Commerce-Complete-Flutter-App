import 'package:e_commerce_complete_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon(
      {Key? key,
      required this.press,
      required this.iconSrc,
      required this.iconColor})
      : super(key: key);
  final VoidCallback press;
  final String iconSrc;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        decoration: BoxDecoration(
          color: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? kContentColorDarkTheme.withOpacity(0.1)
              : kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          iconSrc,
          color: iconColor,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
