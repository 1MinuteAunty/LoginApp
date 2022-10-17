import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  const MyTextField(
      {Key? key,
      required this.textEditingController,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder()
        ));
  }
}
