import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/components/icon_and_text.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/utils/colors.dart';

class HeaderFood extends StatelessWidget {
   HeaderFood({
    Key? key, required this.productPopularDetail,
  }) : super(key: key);

   final ProductsModel productPopularDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: productPopularDetail.name!,color: AppColors.mainBlackColor,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Row(children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: Dimensions.iconSize16,)),),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "4.5"),
            SizedBox(width: Dimensions.width10,),
            SmallText(text: "1287 comments"),
          ],
        ),
        SizedBox(height: Dimensions.height10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(icon: Icons.circle,color: AppColors.iconColor1,text: "Normal",),
            IconAndText(icon: Icons.location_on_rounded,color: AppColors.mainColor,text: "1.7km",),
            IconAndText(icon: Icons.access_time_sharp,color: AppColors.iconColor2,text: "32min",),
          ],
        ),
      ],
    );
  }
}