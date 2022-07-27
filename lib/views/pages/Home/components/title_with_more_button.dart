import 'package:e_commerce_complete_app/constants.dart';
import 'package:flutter/material.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    Key? key,
    required this.title,
    required this.press,
    required this.description,
  }) : super(key: key);

  final String title, description;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? kContentColorLightTheme
                        : kContentColorDarkTheme,
                  ),
            ),
            InkWell(
              onTap: press,
              child: Text(
                "View All",
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding / 10),
        Text(
          description,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }
}
