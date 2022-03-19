import 'package:flutter/material.dart';
import 'package:food_ui/screens/home_page/components/products.dart';

import '../../../controllers/popular_product_controller.dart';
import '../../../controllers/recommended_product_controller.dart';
import '../../../utils/dimensions.dart';
import 'app_bar_home.dart';
import 'banner_food.dart';
import 'package:get/get.dart';


class MainHomePage extends StatefulWidget {
  const MainHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarHome(),
          SizedBox(
            height: Dimensions.height20,
          ),
          const BannerFood(),
          SizedBox(
            height: Dimensions.height30,
          ),
          const Products(),
        ],
      ),
    ), onRefresh: _loadResource);
  }
}
