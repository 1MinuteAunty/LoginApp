import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);
  final void Function() onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontSize: 19)));
  }
}
