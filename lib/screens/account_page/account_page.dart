import 'package:flutter/material.dart';
import 'package:food_ui/base/custom_loader.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/controllers/auth_controller.dart';
import 'package:food_ui/controllers/user_controller.dart';
import 'package:food_ui/routes/route_helper.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:food_ui/utils/dimensions.dart';

import 'components/header_image_profile.dart';
import 'components/profile_infomation.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      print("User has logged"+Get.find<AuthController>().isLoading.toString());
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: Dimensions.height50 * 1.5,
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: BigText(text: "Profile",color: Colors.white,fontWeight: FontWeight.bold,size: Dimensions.font26),
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          return _userLoggedIn?(userController.isLoading?
          Column(
            children: [
              HeaderImageProfile(),
              ProfileInfomation(),
            ],
          ):CustomLoader()):
          Container(child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  height: Dimensions.height20*9,
                  margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/signintocontinue.png"),
                    )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getSignInPage());
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.height20*5,
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Center(child: BigText(text: "Sign in",color: Colors.white,size: Dimensions.font26,)),
                  ),
                ),

              ],
            ),
          ),);
        }
      ),
    );
  }
}


