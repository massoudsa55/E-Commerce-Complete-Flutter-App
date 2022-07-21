import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/utilities/enums.dart';
import 'package:e_commerce_complete_app/utilities/routes.dart';
import 'package:e_commerce_complete_app/views/pages/login/components/or_divider.dart';
import 'package:e_commerce_complete_app/views/pages/login/components/social_icon.dart';
import 'package:e_commerce_complete_app/views/widgets/main_button.dart';
import 'package:e_commerce_complete_app/views/widgets/rounded_input_text_field.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailControler = TextEditingController();
    final passwordControler = TextEditingController();
    final usernameControler = TextEditingController();
    final emailFocusNode = FocusNode();
    final usernameFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();
    var authType = AuthFormType.login;
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
                authType == AuthFormType.login ? "Login" : "Signup",
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? kContentColorDarkTheme
                          : kContentColorLightTheme.withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              if (authType == AuthFormType.signup)
                RoundedInputTextField(
                  controler: usernameControler,
                  focusNode: usernameFocusNode,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(emailFocusNode),
                  msgValidator: 'Please enter your username',
                  hintText: "Enter your username",
                  label: "Username",
                  onChanged: (value) {},
                ),
              if (authType == AuthFormType.signup)
                const SizedBox(height: kDefaultPadding),
              RoundedInputTextField(
                controler: emailControler,
                focusNode: emailFocusNode,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(passwordFocusNode),
                msgValidator: 'Please enter your email',
                hintText: "Enter your email",
                label: "Email",
                onChanged: (value) {},
              ),
              const SizedBox(height: kDefaultPadding),
              RoundedInputTextField(
                isPassword: true,
                controler: passwordControler,
                focusNode: passwordFocusNode,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(passwordFocusNode),
                msgValidator: 'Please enter your password',
                hintText: "Enter your password",
                label: "Password",
                onChanged: (value) {},
              ),
              const SizedBox(height: kDefaultPadding),
              if (authType == AuthFormType.login)
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.forgotPasswordRoute),
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.light
                            ? kContentColorLightTheme
                            : kContentColorDarkTheme,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: kDefaultPadding),
              MainButton(
                text: authType == AuthFormType.login ? "Login" : "Signup",
                press: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed(AppRoutes.homePageRoute);
                  }
                },
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    authType == AuthFormType.login
                        ? "Don't have an Acount ? "
                        : "Already have an Acount ? ",
                    style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? kContentColorLightTheme
                          : kContentColorDarkTheme,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      authType == AuthFormType.login ? "Sign Up" : "Sign In",
                      style: TextStyle(
                        color: MediaQuery.of(context).platformBrightness ==
                                Brightness.light
                            ? kContentColorLightTheme
                            : kContentColorDarkTheme,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      formKey.currentState!.reset();
                      setState(() {
                        if (authType == AuthFormType.login) {
                          authType = AuthFormType.signup;
                        } else {
                          authType = AuthFormType.login;
                        }
                        // authType = (authType == AuthFormType.login)
                        //     ? AuthFormType.signup
                        //     : AuthFormType.login;
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              const OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                    press: () {},
                    iconSrc: "assets/icons/facebook.svg",
                    iconColor: const Color(0xFF4267B2),
                  ),
                  SocialIcon(
                    press: () {},
                    iconSrc: "assets/icons/twitter.svg",
                    iconColor: const Color(0xFF1DA1F2),
                  ),
                  SocialIcon(
                    press: () {},
                    iconSrc: "assets/icons/google-plus.svg",
                    iconColor: const Color(0xFFEA4335),
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
