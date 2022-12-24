import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {

  final String buttonText;
  final ButtonStyle? buttonStyle;
  final void Function() onPressed;

  const ActionButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(buttonText),
      ),
    );
  }
}
