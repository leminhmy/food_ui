import 'package:flutter/material.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:food_ui/controllers/popular_product_controller.dart';
import 'package:food_ui/controllers/recommended_product_controller.dart';
import 'package:food_ui/routes/route_helper.dart';
import 'package:get/get.dart';

import 'cart_item.dart';

class ListCart extends StatelessWidget {
  const ListCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      var _cartList = cartController.getItems;
      return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: List.generate(
            cartController.getItems.length,
                (index) =>
                GestureDetector(
                    onTap: () {
                      var popularIndex = Get
                          .find<PopularProductController>()
                          .popularProductList
                          .indexOf(_cartList[index].product!);
                      if (popularIndex >= 0) {
                          Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cartpage"));
                      } else {
                        var recommendedIndex = Get
                            .find<RecommendedProductController>()
                            .recommendedProductList
                            .indexOf(_cartList[index].product!);
                        Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartpage"));
                      }
                    },
                    child: CartItem(cartModel: cartController.getItems[index])),
          ),
        ),
      );
    });
  }
}
