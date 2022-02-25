import 'package:flutter/material.dart';
import 'package:food_ui/routes/route_helper.dart';

import '../../../components/icon_background_border_radius.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import 'package:get/get.dart';

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
                press: () {},
                sizeHeight: Dimensions.height40,
                size: Dimensions.iconSize24,
                backgroundColor: AppColors.mainColor,
                iconColor: AppColors.buttonBackgroundColor,
              ),
              SizedBox(width: Dimensions.width50,),
              IconBackgroundBorderRadius(
                icon: Icons.shopping_cart_outlined,
                press: () {},
                sizeHeight: Dimensions.height40,
                size: Dimensions.iconSize18,
                backgroundColor: AppColors.mainColor,
                iconColor: AppColors.buttonBackgroundColor,
              ),
            ],
          ),

        ],
      ),
    );
  }
}
