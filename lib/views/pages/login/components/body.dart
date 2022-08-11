import 'package:e_commerce_complete_app/constants.dart';
import 'package:e_commerce_complete_app/utilities/auth.dart';
import 'package:e_commerce_complete_app/utilities/enums.dart';
import 'package:e_commerce_complete_app/utilities/routes.dart';
import 'package:e_commerce_complete_app/views/pages/login/components/or_divider.dart';
import 'package:e_commerce_complete_app/views/pages/login/components/social_icon.dart';
import 'package:e_commerce_complete_app/views/widgets/main_button.dart';
import 'package:e_commerce_complete_app/views/widgets/rounded_input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/auth_controller.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final usernameControler = TextEditingController();
  final emailFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailControler.dispose();
    passwordControler.dispose();
    usernameControler.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRoutes.homePageRoute);
    } catch (e) {
      // ignore: todo
      // TODO: i will refactor the code about this dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error!", style: Theme.of(context).textTheme.headline6),
          content:
              Text(e.toString(), style: Theme.of(context).textTheme.subtitle1),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => AuthController(auth: auth),
      child: Consumer<AuthController>(
        builder: (_, model, __) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding * 2,
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      model.authFormType == AuthFormType.login
                          ? "Login"
                          : "Signup",
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? kContentColorDarkTheme
                                : kContentColorLightTheme.withOpacity(0.6),
                          ),
                    ),
                    const SizedBox(height: kDefaultPadding * 2),
                    if (model.authFormType == AuthFormType.signup)
                      RoundedInputTextField(
                        controler: usernameControler,
                        focusNode: usernameFocusNode,
                        onEditingComplete: () =>
                            FocusScope.of(context).requestFocus(emailFocusNode),
                        msgValidator: 'Please enter your username',
                        hintText: "Enter your username",
                        label: "Username",
                        onChanged: model.updateUsername,
                      ),
                    if (model.authFormType == AuthFormType.signup)
                      const SizedBox(height: kDefaultPadding),
                    RoundedInputTextField(
                      controler: emailControler,
                      focusNode: emailFocusNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(passwordFocusNode),
                      msgValidator: 'Please enter your email',
                      hintText: "Enter your email",
                      label: "Email",
                      onChanged: model.updateEmail,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    RoundedInputTextField(
                      isPassword: true,
                      controler: passwordControler,
                      focusNode: passwordFocusNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(passwordFocusNode),
                      msgValidator: 'Please enter your password',
                      hintText: "Enter your password",
                      label: "Password",
                      onChanged: model.updatePassword,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    if (model.authFormType == AuthFormType.login)
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(
                                  AppRoutes.forgotPasswordRoute),
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
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
                      text: model.authFormType == AuthFormType.login
                          ? "Login"
                          : "Signup",
                      press: () {
                        if (formKey.currentState!.validate()) {
                          _submit(model);
                        }
                      },
                    ),
                    const SizedBox(height: kDefaultPadding * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          model.authFormType == AuthFormType.login
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
                            model.authFormType == AuthFormType.login
                                ? "Sign Up"
                                : "Sign In",
                            style: TextStyle(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? kContentColorLightTheme
                                      : kContentColorDarkTheme,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            formKey.currentState!.reset();
                            model.toggleFormType();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.18),
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
          ),
        ),
      ),
    );
  }
}
