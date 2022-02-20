import 'package:flutter/material.dart';
import 'package:food_ui/components/small_text.dart';

import 'dimensions.dart';

class IconAndText extends StatelessWidget {
  const IconAndText({
    Key? key, required this.text, required this.icon, required this.color,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: color,size: Dimensions.iconSize26,),
        const SizedBox(width: 5,),
        SmallText(text: text,),
      ],
    );
  }
}