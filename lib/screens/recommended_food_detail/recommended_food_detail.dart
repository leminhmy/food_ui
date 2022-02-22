import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/button_background.dart';
import 'package:food_ui/components/button_border_radius.dart';
import 'package:food_ui/controllers/recommended_product_controller.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/utils/app_contants.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/components/expandable_text_widget.dart';
import 'package:food_ui/screens/recommended_food_detail/components/bottom_bar_bottom.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:get/get.dart';
import 'components/bottom_bar_top.dart';

class RecommendedFoodDetail extends StatelessWidget {
    const RecommendedFoodDetail({Key? key,required this.pageId}) : super(key: key);

    final int pageId;

  @override
  Widget build(BuildContext context) {
    ProductsModel product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
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
                ButtonBackground(icon: Icons.clear, press: (){
                  Get.back();
                }),
                ButtonBackground(icon: Icons.shopping_cart_outlined, press: (){}),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height5,bottom: Dimensions.height15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20),topLeft: Radius.circular(Dimensions.radius20))
                ),
                child: Center(child: BigText(size: Dimensions.font22,text: product.name!,fontWeight: FontWeight.bold,)),
                width: double.maxFinite,
              )
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,width: double.maxFinite,fit: BoxFit.cover,),
            ),
          ),
          //body
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.width20),
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
          BottomBarTop(product: product,),
          BottomBarBottom(),
        ],
      ),
    );
  }
}


