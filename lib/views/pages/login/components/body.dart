import 'package:e_commerce_complete_app/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
    );
  }
}
