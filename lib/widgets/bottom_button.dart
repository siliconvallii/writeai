import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const BottomButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 24,
          fontWeight: FontWeight.w300,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xffD31788),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    );
  }
}
