import 'package:flutter/widgets.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CustomHeader extends StatelessWidget {
  final String title;

  const CustomHeader({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientText(
      title,
      style: const TextStyle(
        fontFamily: 'PT Serif',
        fontSize: 64,
        fontWeight: FontWeight.w500,
      ),
      gradientDirection: GradientDirection.ttb,
      colors: const [
        Color(0xffDA1788),
        Color(0xff580A7A),
      ],
    );
  }
}
