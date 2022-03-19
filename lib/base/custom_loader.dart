import 'package:flutter/material.dart';
import 'package:food_ui/controllers/auth_controller.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("I am printing loading state "+Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimensions.height50*2,
        width: Dimensions.width50*2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.height50*2/2),
          color: AppColors.mainColor
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}
