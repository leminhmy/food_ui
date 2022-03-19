import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/base/custom_loader.dart';
import 'package:food_ui/base/show_custom_snackbar.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/button_border_radius.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/controllers/auth_controller.dart';
import 'package:food_ui/models/signup_body_model.dart';
import 'package:food_ui/routes/route_helper.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:food_ui/utils/dimensions.dart';

import '../../components/app_text_field.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var singUpImage = [
      "t.png",
      "f.png",
      "g.png",
    ];
    void _registration(AuthController authController) {
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (email.isEmpty) {
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
        SignUpBody signUpBody = SignUpBody(
            name: name, phone: phone, email: email, password: password);
        authController.registration(signUpBody).then((status){
          if(status.isSuccess){
              print("Success registration");
              Get.offNamed(RouteHelper.getInitial());
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (_authController) {
          return !_authController.isLoading?SingleChildScrollView(
            child: Column(
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
                //body signUp infomation
                Column(
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
                      prefixIcon: Icons.password_sharp,
                      colorIcon: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                      textFieldController: phoneController,
                      hintText: "Phone",
                      prefixIcon: Icons.phone_android_outlined,
                      colorIcon: AppColors.mainColor,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    AppTextField(
                      textFieldController: nameController,
                      hintText: "Name",
                      prefixIcon: Icons.person,
                    ),
                  ],
                ),
                //Sign up and Sign in other ways
                Column(
                  children: [
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    GestureDetector(
                      onTap: () {
                        _registration(_authController);
                      },
                      child: ButtonBorderRadius(
                        widget: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: Dimensions.width20),
                          child: BigText(
                              text: "Sign Up",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              size: Dimensions.font26),
                        ),
                        colorBackground: AppColors.mainColor,
                        borderRadius: Dimensions.radius20 * 1.3,
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    RichText(
                        text: TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.back(),
                            text: "Have an account already?",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20,
                            ))),
                    SizedBox(
                      height: Dimensions.screenHeight * 0.05,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Sign up using one of the following methos",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font16,
                            ))),
                    Wrap(
                      children: List.generate(
                          singUpImage.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: Dimensions.radius30,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      "assets/images/" + singUpImage[index]),
                                ),
                              )),
                    )
                  ],
                ),
              ],
            ),
          ):const CustomLoader();
        }
      ),
    );
  }
}
