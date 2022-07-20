import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/views/widgets/main_button.dart';
import 'package:e_commerce_complete_app/views/widgets/rounded_input_text_field.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    final emailControler = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding * 2,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "Forgoting password",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? kContentColorDarkTheme
                          : kContentColorLightTheme.withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                "Don't have an Acount ? ",
                style: TextStyle(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? kContentColorLightTheme
                      : kContentColorDarkTheme,
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              RoundedInputTextField(
                controler: emailControler,
                msgValidator: 'Please enter your email',
                hintText: "Enter your email",
                label: "Email",
                onChanged: (value) {},
              ),
              const SizedBox(height: kDefaultPadding),
              const SizedBox(height: kDefaultPadding),
              MainButton(text: "Send", press: () {}),
              const SizedBox(height: kDefaultPadding * 3),
            ],
          ),
        ),
      ),
    );
  }
}
