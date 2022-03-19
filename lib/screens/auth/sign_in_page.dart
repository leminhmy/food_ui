import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/base/custom_loader.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/routes/route_helper.dart';
import 'package:food_ui/screens/auth/sign_up_page.dart';

import '../../base/show_custom_snackbar.dart';
import '../../components/app_text_field.dart';
import '../../components/button_border_radius.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();


       if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six character",
            title: "Password");
      } else {
        authController.login(email, password).then((status){
          if(status.isSuccess){
            Get.toNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading?SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: Dimensions.height20),
                  height: Dimensions.screenHeight * 0.25,
                  child: Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/logo part 1.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Hello",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        size: Dimensions.font26 * 2.5,
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Sign into your account",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                //input signIn
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppTextField(
                      textFieldController: emailController,
                      hintText: "Email",
                      prefixIcon: Icons.email,
                      colorIcon: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                      isObscure: true,
                      textFieldController: passwordController,
                      hintText: "Password",
                      prefixIcon: Icons.email,
                      colorIcon: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Dimensions.width20),
                      child: RichText(
                          text: TextSpan(
                              text: "Sign into your account",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ))),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.screenHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            _login(authController);
                          },
                          child: ButtonBorderRadius(
                            widget: Container(
                              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                              child: BigText(
                                  text: "Sign In",
                                  color: Colors.white,
                                  size: Dimensions.font26),
                            ),
                            colorBackground: AppColors.mainColor,
                            borderRadius: Dimensions.radius20 * 1.3,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.screenHeight * 0.05,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Don't have an ccount?",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                                  text: "Create",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.font20,
                                      fontWeight: FontWeight.bold
                                  ),
                                )
                              ]
                          ),

                        ),

                      ],
                    ),


                  ],
                ),

              ],
            ),
          ):CustomLoader();
        }
      ),
    );
  }
}
