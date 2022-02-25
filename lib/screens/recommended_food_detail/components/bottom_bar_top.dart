import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/icon_background_border_radius.dart';
import 'package:food_ui/controllers/popular_product_controller.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:get/get.dart';

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
          child: GetBuilder<PopularProductController>(builder: (controller){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconBackgroundBorderRadius(icon: Icons.remove, press: (){
                  controller.setQuantity(false);
                },backgroundColor: AppColors.mainColor,iconColor: AppColors.buttonBackgroundColor,),
                SizedBox(width: Dimensions.width40,),
                Row(
                  children: [
                    BigText(text: "\$ ${product.price!}",),
                    SizedBox(width: Dimensions.width5,),
                    BigText(text: "X"),
                    SizedBox(width: Dimensions.width5,),
                    BigText(text: controller.inCarItems.toString()),
                  ],
                ),
                SizedBox(width: Dimensions.width40,),
                IconBackgroundBorderRadius(icon: Icons.add, press: (){
                  controller.setQuantity(true);
                },backgroundColor: AppColors.mainColor,iconColor: AppColors.buttonBackgroundColor,),
              ],
            );
          },),
        ),
      ],
    );
  }
}