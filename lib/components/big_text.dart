import 'package:flutter/material.dart';
import 'package:food_ui/components/dimensions.dart';

class BigText extends StatelessWidget {
   BigText(
      {Key? key,
        required this.text,
        this.size = 22,
        this.color = const Color(0xFF332d2b), this.textOverflow = TextOverflow.ellipsis, this.fontWeight=FontWeight.w500})
      : super(key: key);

  final String text;
  final double size;
  final Color color;
  final TextOverflow textOverflow;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: size==22?Dimensions.font22:size, fontFamily: "Roboto",fontWeight: fontWeight),
    );
  }
}
