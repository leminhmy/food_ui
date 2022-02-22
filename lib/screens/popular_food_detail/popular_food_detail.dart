import 'package:flutter/material.dart';
import 'package:food_ui/components/button_background.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'components/body_widget.dart';
import 'components/bottom_bar.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: imageAppbar(),
          ),
          Positioned(
            right: Dimensions.width20,
            left: Dimensions.width20,
            top: Dimensions.height20,
            child: appBarActions(),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: Dimensions.pageView - Dimensions.height20,
            child: BodyWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}

imageAppbar() {
  return SizedBox(
      height: Dimensions.pageView,
      child: Image.asset(
        "assets/images/food0.png",
        fit: BoxFit.cover,
      ));
}

appBarActions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ButtonBackground(
        icon: Icons.arrow_back_ios_outlined,
        press: () {},
      ),
      ButtonBackground(
        icon: Icons.shopping_cart_outlined,
        press: () {},
      ),
    ],
  );
}
