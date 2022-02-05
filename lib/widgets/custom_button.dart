import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final VoidCallback? onPressed;
  final bool showBorder;
  final String label;

  const CustomButton({
    Key? key,
    required this.buttonColor,
    required this.onPressed,
    required this.showBorder,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(
          width: 1.5,
          color: showBorder ? Colors.black : buttonColor,
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 12.0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.1,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
