import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/models/products_model.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/components/expandable_text_widget.dart';

import 'header_food.dart';


class BodyWidget extends StatelessWidget {
  BodyWidget({
    Key? key, required this.productsPopularDetail,
  }) : super(key: key);

  final ProductsModel productsPopularDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.width20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius20),
          topLeft: Radius.circular(Dimensions.radius20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderFood(productPopularDetail: productsPopularDetail),
          SizedBox(
            height: Dimensions.height10,
          ),

          //description
          BigText(text: "Introduce"),
          SizedBox(
            height: Dimensions.height10,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: ExpandableTextWidget(text: productsPopularDetail.description!))),
        ],
      ),
    );
  }
}