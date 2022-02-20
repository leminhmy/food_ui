import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/dimensions.dart';
import 'package:food_ui/components/icon_and_text.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/utils/colors.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Dimensions.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //image product
          ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular(Dimensions.radius20)),
              child: Image.asset(
                "assets/image/food1.png",
                fit: BoxFit.cover,
                height: Dimensions.pageViewTextContainer,
              )),
          //information product
          Expanded(
            child: Container(
              padding: EdgeInsets.all(Dimensions.width10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius20)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.paraColor.withOpacity(0.3),
                      blurRadius: 1,
                    ),

                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Nuritious fruit meal"),
                  SmallText(text: "Width chinese charaterstics"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                          text: "Normal",
                          icon: Icons.circle,
                          color: AppColors.iconColor1),
                      IconAndText(
                          text: "17Km",
                          icon: Icons.location_on_rounded,
                          color: AppColors.mainColor),
                      IconAndText(
                          text: "Normal",
                          icon: Icons.access_time,
                          color: AppColors.iconColor2),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}