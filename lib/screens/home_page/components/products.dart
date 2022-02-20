import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/dimensions.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/screens/home_page/components/product_card.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelProduct(),
          SizedBox(
            height: Dimensions.height30,
          ),
          listProduct()
        ],
      ),
    );
  }
}

listProduct() {
  return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const ProductCard();
      });
}

labelProduct() {
  return Row(
    children: [
      BigText(text: "Popular"),
      SizedBox(
        width: Dimensions.width10,
      ),
      SmallText(text: "."),
      SizedBox(
        width: Dimensions.width10,
      ),
      SmallText(text: "Food paining"),
    ],
  );
}
