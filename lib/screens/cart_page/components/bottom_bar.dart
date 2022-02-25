import 'package:flutter/material.dart';

import '../../../components/big_text.dart';
import '../../../components/button_border_radius.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';

class BottomBarCart extends StatelessWidget {
  const BottomBarCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20, vertical: Dimensions.height30),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius30),
            topRight: Radius.circular(Dimensions.radius30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //quantity
          ButtonBorderRadius(
              widget: BigText(
                text: "\$ 21751.0",
                color: Colors.black,
              )),
          //addToCard
          ButtonBorderRadius(
            widget: GestureDetector(
              onTap: () {},
              child: BigText(
                text: "Check out",
                color: Colors.white,
              ),
            ),
            colorBackground: AppColors.mainColor,
          )
        ],
      ),
    );
  }
}
