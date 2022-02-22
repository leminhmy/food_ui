import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/button_border_radius.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/utils/colors.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height30),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius40),
            topRight: Radius.circular(Dimensions.radius40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //quantity
          ButtonBorderRadius(widget: Row(
            children: [
              InkWell(
                onTap: (){},
                child: Icon(Icons.remove,color: AppColors.signColor,),
              ),
              SizedBox(width: Dimensions.width10,),
              BigText(text: "0"),
              SizedBox(width: Dimensions.width10,),
              InkWell(
                onTap: (){},
                child: Icon(Icons.add,color: AppColors.signColor,),
              ),
            ],
          ),),
          //addToCard
          ButtonBorderRadius(widget: BigText(text: "\$0.08 Add to cart",color: Colors.white,),colorBackground: AppColors.mainColor,)
        ],
      ),
    );
  }
}