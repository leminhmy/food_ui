import 'package:flutter/material.dart';
import 'package:food_ui/components/button_background.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:food_ui/controllers/popular_product_controller.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/screens/home_page/home_page.dart';
import 'package:food_ui/utils/app_contants.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'components/body_widget.dart';
import 'components/bottom_bar.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartController>());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: imageAppbar(product),
          ),
          Positioned(
            right: Dimensions.width20,
            left: Dimensions.width20,
            top: Dimensions.height20,
            child: appBarActions(),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: Dimensions.pageView - Dimensions.height20,
            child: BodyWidget(productsPopularDetail: product),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(productPopularDetail: product),
    );
  }
}

imageAppbar(ProductsModel product) {
  return SizedBox(
      height: Dimensions.pageView,
      child: Image.network(
        AppConstants.BASE_URL + AppConstants.UPLOAD_URL +product.img!,
        fit: BoxFit.cover,
      ));
}

appBarActions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ButtonBackground(
        icon: Icons.arrow_back_ios_outlined,
        press: () {
          Get.back();
        },
      ),
      ButtonBackground(
        icon: Icons.shopping_cart_outlined,
        press: () {
        },
      ),
    ],
  );
}
