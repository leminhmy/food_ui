import 'package:flutter/material.dart';
import 'package:food_ui/components/dimensions.dart';

class SmallText extends StatelessWidget {
   SmallText(
      {Key? key,
      required this.text,
      this.size = 16,
      this.height = 1.2,
      this.color = const Color(0xFFccc7c5)})
      : super(key: key);

  final String text;
  final double size;
  final double height;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: size==16?Dimensions.font16:size, height: height, fontFamily: "Roboto"),
    );
  }
}
