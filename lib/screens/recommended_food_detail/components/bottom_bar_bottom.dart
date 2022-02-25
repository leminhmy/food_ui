import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/button_border_radius.dart';
import 'package:food_ui/controllers/popular_product_controller.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BottomBarBottom extends StatelessWidget {
  BottomBarBottom({
    Key? key, required this.product,
  }) : super(key: key);

  final ProductsModel product;

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
      child: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //favorite
              ButtonBorderRadius(widget: Container(
                margin: EdgeInsets.all(Dimensions.width5),
                  child: Icon(Icons.favorite,color: AppColors.mainColor,size: Dimensions.font26
                    ,)),),
              //addToCard
              ButtonBorderRadius(widget: GestureDetector(
                onTap: (){
                  controller.addItem(product);
                },
                child: Container(
                    margin: EdgeInsets.all(Dimensions.width5),
                    child: BigText(text: "\$ ${product.price!} | Add to cart",color: Colors.white,)),
              ),colorBackground: AppColors.mainColor,)
            ],
          );
        }
      ),
    );
  }
}