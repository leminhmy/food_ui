import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/utils/dimensions.dart';
import 'package:food_ui/components/expandable_text_widget.dart';

import 'header_food.dart';


class BodyWidget extends StatelessWidget {
  BodyWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String textRamdom =
        "around their good she Depending first right west wish am snug as Visited these hundred strangers mean formerly him got going happy formerly besides or reserved compliment held the uneasy moment real tended suitable understood newspaper until strictly warmth u Collected valley during his could views some does have yesterday men produce Dashwood Preferred might he Depending first right west wish am snug as Visited these hundred strangers mean formerly him got going happy formerly besides or reserved compliment held the uneasy moment real tended suitable understood newspaper until strictly warmth u Collected valley during his could views some does have yesterday men produce Dashwood Preferred might n no pleasure disposing within inhabiting prudent few Polite true We boy packages against sent how set His your Attended offering leave very has sufficient garret doubt be keepf dwelling no latter now drawings ecstatic between neither suspected much mrs wife above favour excuse questions What wont mother otherwise Welcomed Neglected case asked saw water came ten nor matter  in Felicity oh forming true Necessary excited questions him Inquietude mirth felicity may Houses itself uneasy terminated lady mr be stood his china so partiality such out of having Rich in village or residence Own end mean six Prepared hence Handsome of built ";

    return Container(
      padding: EdgeInsets.all(Dimensions.width20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimensions.radius20),
          topLeft: Radius.circular(Dimensions.radius20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderFood(),
          SizedBox(
            height: Dimensions.height10,
          ),

          //description
          BigText(text: "Introduce"),
          SizedBox(
            height: Dimensions.height10,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: ExpandableTextWidget(text: textRamdom))),
        ],
      ),
    );
  }
}