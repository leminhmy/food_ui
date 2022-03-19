import 'package:flutter/material.dart';

import '../../../components/big_text.dart';
import '../../../components/icon_background_border_radius.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';

class HearderAppBar extends StatelessWidget {
  const HearderAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height50 * 2,
      color: AppColors.mainColor,
      padding: EdgeInsets.only(top: Dimensions.height15 * 3),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BigText(
            text: "Cart Hisstory",
            color: Colors.white,
          ),
          IconBackgroundBorderRadius(
            icon: Icons.shopping_cart_outlined,
            press: () {},
            size: Dimensions.width20,
          ),
        ],
      ),
    );
  }
}
