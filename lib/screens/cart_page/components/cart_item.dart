import 'package:flutter/material.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:food_ui/models/cart_model.dart';
import 'package:food_ui/utils/app_contants.dart';
import 'package:get/get.dart';

import '../../../components/big_text.dart';
import '../../../components/small_text.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key, required this.cartModel,
  }) : super(key: key);

  final CartModel cartModel;

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
              child: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+cartModel.img!,
                fit: BoxFit.cover,
                height: Dimensions.pageViewTextContainer,
                width: Dimensions.pageViewTextContainer,
              )
          ),
          //information product
          Expanded(
            child: Container(
              padding: EdgeInsets.all(Dimensions.width10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Dimensions.radius10)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.paraColor.withOpacity(0.1),
                      blurRadius: 1,
                    ),

                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: cartModel.name!),
                  SizedBox(height: Dimensions.height5,),
                  SmallText(text: "Spicy"),
                  SizedBox(height: Dimensions.height5,),
                  GetBuilder<CartController>(
                    builder: (cartController) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: "\$ ${cartModel.price!}",
                            color: AppColors.redColor,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  cartController.setQuantity(cartModel, false);
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: AppColors.signColor,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              BigText(text: cartModel.quantity!.toString()),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              InkWell(
                                onTap: () {
                                },
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.signColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
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