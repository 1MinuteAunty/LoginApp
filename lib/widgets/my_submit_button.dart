import 'package:flutter/material.dart';

class MySubmitButton extends StatelessWidget {
  const MySubmitButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);
  final String label;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(label,
            style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 20)));
  }
}
