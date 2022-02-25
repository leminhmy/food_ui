import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/button_border_radius.dart';
import 'package:food_ui/controllers/popular_product_controller.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    Key? key,
    required this.productPopularDetail,
  }) : super(key: key);

  final ProductsModel productPopularDetail;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20, vertical: Dimensions.height30),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius40),
            topRight: Radius.circular(Dimensions.radius40)),
      ),
      child: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //quantity
            ButtonBorderRadius(widget: Row(
              children: [
                InkWell(
                  onTap: () {
                    popularProduct.setQuantity(false);
                  },
                  child: Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                BigText(text: popularProduct.inCarItems.toString()),
                SizedBox(
                  width: Dimensions.width10,
                ),
                InkWell(
                  onTap: () {
                    popularProduct.setQuantity(true);
                  },
                  child: Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ),
              ],
            )),
            //addToCard
            ButtonBorderRadius(
              widget: GestureDetector(
                onTap: (){
                  popularProduct.addItem(productPopularDetail);
                },
                child: BigText(
                  text: "\$ ${productPopularDetail.price} | Add to cart",
                  color: Colors.white,
                ),
              ),
              colorBackground: AppColors.mainColor,
            )
          ],
        );
      },),
    );
  }
}
