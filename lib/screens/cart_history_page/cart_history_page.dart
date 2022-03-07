import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/icon_background_border_radius.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:food_ui/utils/app_contants.dart';
import 'package:food_ui/utils/colors.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.mainColor,
            padding: EdgeInsets.only(top: 45),
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart Hisstory",
                  color: Colors.white,
                ),
                IconBackgroundBorderRadius(
                  icon: Icons.shopping_cart_outlined,
                  press: () {},
                  size: Dimensions.width20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (int i = 0; i < itemsPerOrder.length; i++)
                      Container(
                        height: 120,
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ((){
                              DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
                              var inputDate = DateTime.parse(parseDate.toString());
                              var outputFormat= DateFormat("MM/dd/yyyy hh:mm a");
                              var outputDate = outputFormat.format(inputDate);

                              print("parseDate" + parseDate.toString());
                              print("inputDate" + inputDate.toString());
                              return BigText(text: outputDate);

                            }()),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(itemsPerOrder[i], (index) {
                                    if (listCounter <
                                        getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return index <= 2
                                        ? Container(
                                            height: 80,
                                            width: 80,
                                            margin: EdgeInsets.only(
                                                right: Dimensions.width10 / 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius15 /
                                                            2),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        AppConstants.BASE_URL +
                                                            AppConstants
                                                                .UPLOAD_URL +
                                                            getCartHistoryList[
                                                                    listCounter -
                                                                        1]
                                                                .img!),
                                                    fit: BoxFit.cover)),
                                          )
                                        : Container();
                                  }),
                                ),
                                Container(
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SmallText(text: "Total",color: AppColors.titleColor),
                                      BigText(
                                        text: itemsPerOrder[i].toString()+" Items",
                                        color: AppColors.titleColor,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: Dimensions.height5,horizontal: Dimensions.height10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.mainColor,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                        ),
                                        child: SmallText(text: "one more",color: AppColors.mainColor,),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
