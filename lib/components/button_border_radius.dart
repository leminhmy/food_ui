import 'package:flutter/material.dart';

import 'dimensions.dart';

class ButtonBorderRadius extends StatelessWidget {
  ButtonBorderRadius({
    Key? key, required this.widget, this.colorBackground = Colors.white,
  }) : super(key: key);

  final Widget widget;
  final Color colorBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(Dimensions.width15),
        decoration: BoxDecoration(
          color: colorBackground==Colors.white?Colors.white:colorBackground,
          borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
        ),
        child: widget
    );
  }
}