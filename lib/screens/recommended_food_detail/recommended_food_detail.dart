import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/icon_background_border_radius.dart';
import 'package:food_ui/components/button_border_radius.dart';
import 'package:food_ui/controllers/recommended_product_controller.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/utils/app_contants.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/components/expandable_text_widget.dart';
import 'package:food_ui/screens/recommended_food_detail/components/bottom_bar_bottom.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../routes/route_helper.dart';
import '../cart_page/cart_page.dart';
import 'components/bottom_bar_top.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  final int pageId;

  @override
  Widget build(BuildContext context) {
    ProductsModel product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //appbarHeader
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            collapsedHeight: 80,
            backgroundColor: AppColors.yellowColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBackgroundBorderRadius(
                    icon: Icons.clear,
                    press: () {
                      Get.toNamed(RouteHelper.initial);
                    }),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      IconBackgroundBorderRadius(
                        icon: Icons.shopping_cart_outlined,
                        press: () {
                          Get.to(()=> CartPage());
                        },
                      ),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  IconBackgroundBorderRadius(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                    sizeHeight: 20,
                                    press: () {},
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: BigText(
                                        text:
                                            Get.find<PopularProductController>()
                                                .totalItems
                                                .toString(),
                                        color: Colors.white,
                                        size: Dimensions.font12,
                                      )),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height20),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height5, bottom: Dimensions.height15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          topLeft: Radius.circular(Dimensions.radius20))),
                  child: Center(
                      child: BigText(
                    size: Dimensions.font22,
                    text: product.name!,
                    fontWeight: FontWeight.bold,
                  )),
                  width: double.maxFinite,
                )),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //body
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: ExpandableTextWidget(
                text: product.description!,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomBarTop(
            product: product,
          ),
          BottomBarBottom(product: product),
        ],
      ),
    );
  }
}
