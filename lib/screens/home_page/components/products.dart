import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/controllers/recommended_product_controller.dart';
import 'package:food_ui/routes/route_helper.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/screens/home_page/components/product_card.dart';
import 'package:get/get.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelProduct(),
          SizedBox(
            height: Dimensions.height30,
          ),
          GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
            return recommendedProduct.isLoaded?listProduct(recommendedProduct):
            CircularProgressIndicator(color: AppColors.mainColor,);

          })
        ],
      ),
    );
  }
}

listProduct(RecommendedProductController recommendedProduct) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
      itemCount: recommendedProduct.recommendedProductList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return  GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
            },
            child: ProductCard(recommendedProduct: recommendedProduct.recommendedProductList[index],));
      });
}

labelProduct() {
  return Row(
    children: [
      BigText(text: "Recommended"),
      SizedBox(
        width: Dimensions.width10,
      ),
      SmallText(text: "."),
      SizedBox(
        width: Dimensions.width10,
      ),
      SmallText(text: "Food paining"),
    ],
  );
}
