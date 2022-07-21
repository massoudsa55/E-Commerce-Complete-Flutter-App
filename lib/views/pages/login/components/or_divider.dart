import 'package:e_commerce_complete_app/constants.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: [
          buildDivider(context),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Text(
              "Or",
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? kContentColorDarkTheme
                        : kContentColorLightTheme.withOpacity(0.6),
                  ),
            ),
          ),
          buildDivider(context),
        ],
      ),
    );
  }

  Expanded buildDivider(BuildContext context) {
    return Expanded(
      child: Divider(
        height: 1.5,
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kContentColorDarkTheme
            : kContentColorLightTheme.withOpacity(0.6),
      ),
    );
  }
}
