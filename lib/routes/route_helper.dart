import 'package:food_ui/screens/home_page/home_page.dart';
import 'package:food_ui/screens/popular_food_detail/popular_food_detail.dart';
import 'package:food_ui/screens/recommended_food_detail/recommended_food_detail.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String initial ="/";
  static const String popularFood ='/popular-food';
  static const String recommendedFood ='/recommended-food';

  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';


  static List<GetPage> routes =[
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail(pageId: int.parse(pageId!),);
    },
      transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!));
    },
      transition: Transition.fadeIn
    ),
  ];
}