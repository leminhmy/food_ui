import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/controllers/popular_product_controller.dart';
import 'package:food_ui/routes/route_helper.dart';
import 'package:food_ui/screens/popular_food_detail/popular_food_detail.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:get/get.dart';

import 'banner_card.dart';

class BannerFood extends StatefulWidget {
  const BannerFood({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerFood> createState() => _BannerFoodState();
}

class _BannerFoodState extends State<BannerFood> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return  popularProducts.isLoaded?bannerSlider(popularProducts):
          Center(child: CircularProgressIndicator(color: AppColors.mainColor,));
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return buildDotsIndicator(popularProducts);
        }),
      ],
    );
  }

  buildDotsIndicator(PopularProductController popularProducts) {
    return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        );
  }

  bannerSlider(PopularProductController popularProductController) {
    return SizedBox(
      height: Dimensions.pageView,
      child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: popularProductController.popularProductList.length,
          itemBuilder: (context, index) {
            return BannerCard(
              index: index,
              currPageValue: _currPageValue,
              height: Dimensions.pageViewContainer,
              popularProduct: popularProductController.popularProductList[index],
            );
          }),
    );
  }
}
