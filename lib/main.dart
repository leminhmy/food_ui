import 'package:flutter/material.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:food_ui/controllers/popular_product_controller.dart';
import 'package:food_ui/controllers/recommended_product_controller.dart';
import 'package:food_ui/routes/route_helper.dart';
import 'package:food_ui/screens/account_page/account_page.dart';
import 'package:food_ui/screens/auth/sign_in_page.dart';
import 'package:food_ui/screens/auth/sign_up_page.dart';
import 'package:food_ui/screens/cart_history_page/cart_history_page.dart';
import 'package:food_ui/screens/home_page/home_page.dart';
import 'package:food_ui/screens/popular_food_detail/popular_food_detail.dart';
import 'package:food_ui/screens/recommended_food_detail/recommended_food_detail.dart';
import 'package:food_ui/screens/splash/splash_page.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: const SignInPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    },);
  }
}
