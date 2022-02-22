
import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/components/icon_and_text.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/utils/colors.dart';

import 'components/app_bar_home.dart';
import 'components/banner_food.dart';
import 'components/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
      ),
    );
  }
}


