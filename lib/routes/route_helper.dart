import 'package:food_ui/screens/address/add_address_page.dart';
import 'package:food_ui/screens/auth/sign_in_page.dart';
import 'package:food_ui/screens/cart_page/cart_page.dart';
import 'package:food_ui/screens/home_page/home_page.dart';
import 'package:food_ui/screens/popular_food_detail/popular_food_detail.dart';
import 'package:food_ui/screens/recommended_food_detail/recommended_food_detail.dart';
import 'package:food_ui/screens/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String splashPage = "/splash-page";
  static const String initial ="/";
  static const String popularFood ='/popular-food';
  static const String recommendedFood ='/recommended-food';
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-in';

  static const String addAddress = "/add-address";


  static getSplashPage()=> '$splashPage';
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) => '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=> '$cartPage';
  static String getSignInPage()=> '$signIn';
  static String getAddressPage() => '$addAddress';


  static List<GetPage> routes =[
    GetPage(name: splashPage, page: ()=> SplashScreen()),
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name: signIn, page: ()=>SignInPage(),transition: Transition.fade),
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters["page"];
      return RecommendedFoodDetail(pageId: int.parse(pageId!),page: page!);
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
      transition: Transition.fadeIn,
    ),
    GetPage(name: addAddress, page: (){
      return AddAddressPage();
    },
    ),
  ];
}