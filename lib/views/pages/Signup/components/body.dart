import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/utilities/routes.dart';
import 'package:e_commerce_complete_app/views/widgets/main_button.dart';
import 'package:e_commerce_complete_app/views/widgets/rounded_input_text_field.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final usernameControler = TextEditingController();
    final emailControler = TextEditingController();
    final passwordControler = TextEditingController();
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
                "Signup",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? kContentColorDarkTheme
                          : kContentColorLightTheme.withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              RoundedInputTextField(
                controler: usernameControler,
                msgValidator: 'Please enter your username',
                hintText: "Enter your Username",
                label: "Username",
                onChanged: (value) {},
              ),
              const SizedBox(height: kDefaultPadding),
              RoundedInputTextField(
                controler: emailControler,
                msgValidator: 'Please enter your email',
                hintText: "Enter your email",
                label: "Email",
                onChanged: (value) {},
              ),
              const SizedBox(height: kDefaultPadding),
              RoundedInputTextField(
                isPassword: true,
                controler: passwordControler,
                msgValidator: 'Please enter your password',
                hintText: "Enter your password",
                label: "Password",
                onChanged: (value) {},
              ),
              const SizedBox(height: kDefaultPadding),
              MainButton(text: "Login", press: () {}),
              const SizedBox(height: kDefaultPadding * 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Acount ? ",
                    style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? kContentColorLightTheme
                          : kContentColorDarkTheme,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.loginPage),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.light
                            ? kContentColorLightTheme
                            : kContentColorDarkTheme,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
