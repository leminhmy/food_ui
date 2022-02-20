import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/button_border_radius.dart';
import 'package:food_ui/components/dimensions.dart';
import 'package:food_ui/utils/colors.dart';

class BottomBarBottom extends StatelessWidget {
  BottomBarBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height15),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius40),
            topRight: Radius.circular(Dimensions.radius40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //favorite
          ButtonBorderRadius(widget: Container(
            margin: EdgeInsets.all(Dimensions.width5),
              child: Icon(Icons.favorite,color: AppColors.mainColor,size: Dimensions.font26
                ,)),),
          //addToCard
          ButtonBorderRadius(widget: Container(
              margin: EdgeInsets.all(Dimensions.width5),
              child: BigText(text: "\$28 | Add to cart",color: Colors.white,)),colorBackground: AppColors.mainColor,)
        ],
      ),
    );
  }
}