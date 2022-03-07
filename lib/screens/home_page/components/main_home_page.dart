import 'package:flutter/material.dart';
import 'package:food_ui/screens/home_page/components/products.dart';

import '../../../utils/dimensions.dart';
import 'app_bar_home.dart';
import 'banner_food.dart';


class MainHomePage extends StatelessWidget {
  const MainHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
