import 'package:flutter/material.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:food_ui/routes/route_helper.dart';

import '../../../components/big_text.dart';
import '../../../components/icon_background_border_radius.dart';
import '../../../controllers/popular_product_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import 'package:get/get.dart';

import '../cart_page.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height30,bottom: Dimensions.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconBackgroundBorderRadius(
            icon: Icons.arrow_back_ios_outlined,
            press: () {
                Get.toNamed(RouteHelper.initial);
            },
            sizeHeight: Dimensions.height40,
            size: Dimensions.iconSize18,
            backgroundColor: AppColors.mainColor,
            iconColor: AppColors.buttonBackgroundColor,
          ),
          Row(
            children: [
              IconBackgroundBorderRadius(
                icon: Icons.home_outlined,
                press: () {
                  Get.toNamed(RouteHelper.initial);
                },
                sizeHeight: Dimensions.height40,
                size: Dimensions.iconSize24,
                backgroundColor: AppColors.mainColor,
                iconColor: AppColors.buttonBackgroundColor,
              ),
              SizedBox(width: Dimensions.width50,),
              GetBuilder<CartController>(builder: (controller) {
                return Stack(
                  children: [
                    IconBackgroundBorderRadius(
                      icon: Icons.shopping_cart_outlined,
                      press: () {

                      },
                      sizeHeight: Dimensions.height40,
                      size: Dimensions.iconSize18,
                      backgroundColor: AppColors.mainColor,
                      iconColor: Colors.white,
                    ),
                    controller.totalItems >= 1
                        ? Positioned(
                      right: 0,top: 0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          IconBackgroundBorderRadius(
                            icon: Icons.circle,
                            size: 20,
                            iconColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            sizeHeight: 20,
                            press: () {},
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: BigText(text: controller.totalItems.toString(),color: AppColors.blackColor,size: Dimensions.font12,)),
                        ],
                      ),
                    )
                        : Container(),
                  ],
                );
              }),

            ],
          ),

        ],
      ),
    );
  }
}
