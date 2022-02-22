import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/utils/colors.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Dimensions.height30,
          right: Dimensions.width20,
          left: Dimensions.width20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          nameCardApp(),
          searchProduct(),
        ],
      ),
    );
  }
}

nameCardApp() {
  return Column(
    children: [
      BigText(
        text: "Bangladesh",
        color: AppColors.mainColor,
      ),
      Row(
        children: [
          SmallText(
            text: "Narshingdi",
            color: Colors.black54,
            size: Dimensions.font16,
          ),
          const Icon(Icons.arrow_drop_down_outlined),
        ],
      ),
    ],
  );
}

searchProduct() {
  return Container(
    height: Dimensions.height45,
    width: Dimensions.height45,
    decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius10))),
    child: IconButton(
        color: AppColors.mainColor,
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: Colors.white,
        )),
  );
}
