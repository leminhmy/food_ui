import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/button_background.dart';
import 'package:food_ui/components/button_border_radius.dart';
import 'package:food_ui/components/dimensions.dart';
import 'package:food_ui/components/expandable_text_widget.dart';
import 'package:food_ui/screens/recommended_food_detail/components/bottom_bar_bottom.dart';
import 'package:food_ui/utils/colors.dart';

import 'components/bottom_bar_top.dart';

class RecommenededFoodDetail extends StatefulWidget {
  const RecommenededFoodDetail({Key? key}) : super(key: key);

  @override
  _RecommenededFoodDetailState createState() => _RecommenededFoodDetailState();
}

class _RecommenededFoodDetailState extends State<RecommenededFoodDetail> {

  String textRamdom =
      "around their good she Depending first right west wish am snug as Visited these hundred strangers mean formerly him got going happy formerly besides or reserved compliment held the uneasy moment real tended suitable understood newspaper until strictly warmth u Collected valley during his could views some does have yesterday men produce Dashwood Preferred might he Depending first right west wish am snug as Visited these hundred strangers mean formerly him got going happy formerly besides or reserved compliment held the uneasy moment real tended suitable understood newspaper until strictly warmth u Collected valley during his could views some does have yesterday men produce Dashwood Preferred might n no pleasure disposing within inhabiting prudent few Polite true We boy packages against sent how set His your Attended offering leave very has sufficient garret doubt be keepf dwelling no latter now drawings ecstatic between neither suspected much mrs wife above favour excuse questions What wont mother otherwise Welcomed Neglected case asked saw water came ten nor matter  in Felicity oh forming true Necessary excited questions him Inquietude mirth felicity may Houses itself uneasy terminated lady mr be stood his china so partiality such out of having Rich in village or residence Own end mean six Prepared hence Handsome of built ";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //appbarHeader
          SliverAppBar(
            pinned: true,
            collapsedHeight: 80,
            backgroundColor: AppColors.yellowColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonBackground(icon: Icons.clear, press: (){}),
                ButtonBackground(icon: Icons.shopping_cart_outlined, press: (){}),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.height20),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height5,bottom: Dimensions.height15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius20),topLeft: Radius.circular(Dimensions.radius20))
                ),
                child: Center(child: BigText(size: Dimensions.font22,text: "Chinese Side",fontWeight: FontWeight.bold,)),
                width: double.maxFinite,
              )
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/image/food0.png",width: double.maxFinite,fit: BoxFit.cover,),
            ),
          ),
          //body
          SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: ExpandableTextWidget(
                text: textRamdom,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomBarTop(),
          BottomBarBottom(),
        ],
      ),
    );
  }
}


