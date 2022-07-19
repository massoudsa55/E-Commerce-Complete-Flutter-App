import 'package:flutter/material.dart';

class RoundedInputTextField extends StatelessWidget {
  const RoundedInputTextField({
    Key? key,
    required this.controler,
    required this.label,
    required this.msgValidator,
    required this.hintText,
    required this.onChanged,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controler;
  final String label, msgValidator, hintText;
  final bool isPassword;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        obscureText: isPassword,
        onChanged: onChanged,
        controller: controler,
        validator: (value) => value!.isEmpty ? msgValidator : null,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
        ),
      ),
    );
  }
}
