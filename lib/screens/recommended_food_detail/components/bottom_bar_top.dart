import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/button_background.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/utils/colors.dart';

class BottomBarTop extends StatelessWidget {
  BottomBarTop({
    Key? key, required this.product,
  }) : super(key: key);

  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonBackground(icon: Icons.remove, press: (){},backgroundColor: AppColors.mainColor,iconColor: AppColors.buttonBackgroundColor,),
              SizedBox(width: Dimensions.width40,),
              Row(
                children: [
                  BigText(text: "\$ ${product.price!}",),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "X"),
                  SizedBox(width: Dimensions.width5,),
                  BigText(text: "0"),
                ],
              ),
              SizedBox(width: Dimensions.width40,),
              ButtonBackground(icon: Icons.add, press: (){},backgroundColor: AppColors.mainColor,iconColor: AppColors.buttonBackgroundColor,),
            ],
          ),
        ),
      ],
    );
  }
}