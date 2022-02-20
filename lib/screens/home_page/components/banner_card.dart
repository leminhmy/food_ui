import 'package:flutter/material.dart';
import 'package:food_ui/components/big_text.dart';
import 'package:food_ui/components/dimensions.dart';
import 'package:food_ui/components/icon_and_text.dart';
import 'package:food_ui/components/small_text.dart';
import 'package:food_ui/utils/colors.dart';

class BannerCard extends StatelessWidget {
 const BannerCard({
    Key? key, required this.index, required this.currPageValue, this.scaleFactor = 0.8, this.height = 0,
  }) : super(key: key);

  final int index;
  final double currPageValue;
  final double scaleFactor ;
  final double height;

  @override
  Widget build(BuildContext context) {
    height ==0?Dimensions.pageViewContainer:height;

    Matrix4 matrix = new Matrix4.identity();
    if(index == currPageValue.floor())
    {
      var currScale = 1-(currPageValue-index)*(1-scaleFactor);
      var currTrans = height*(1-currScale) / 2;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
    }else if(index == currPageValue.floor()+1)
    {
      var currScale = scaleFactor+(currPageValue-index+1)*(1-scaleFactor);
      var currTrans = height*(1-currScale) / 2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
    }else if(index == currPageValue.floor()-1)
    {
      var currScale = 1-(currPageValue-index)*(1-scaleFactor);
      var currTrans = height*(1-currScale) / 2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,currTrans,0);
    }else
    {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0,height*(1-scaleFactor)/2,0);

    }
    return Transform(
      transform: matrix,
      child: Padding(
        padding: EdgeInsets.only(right: Dimensions.width30),
        child: Align(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              //imageBackground banner
              Container(
                height: Dimensions.pageViewContainer,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/image/food0.png"),fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius30))
                ),
              ),

              //information banner
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:  EdgeInsets.all(Dimensions.width20),
                  padding:  EdgeInsets.all(Dimensions.width15),
                  height: Dimensions.pageViewTextContainer,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.paraColor,
                        blurRadius: 7,
                        spreadRadius: -3,
                        offset: const Offset(0,5),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius20)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: "Chinese Side",color: AppColors.mainBlackColor,),
                      Row(
                        children: [
                          Row(children: List.generate(5, (index) => Icon(Icons.star,color: AppColors.mainColor,size: Dimensions.iconSize16,)),),
                          SizedBox(width: Dimensions.width10,),
                          SmallText(text: "4.5"),
                          SizedBox(width: Dimensions.width10,),
                          SmallText(text: "1287 comments"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndText(icon: Icons.circle,color: AppColors.iconColor1,text: "Normal",),
                          IconAndText(icon: Icons.location_on_rounded,color: AppColors.mainColor,text: "1.7km",),
                          IconAndText(icon: Icons.access_time_sharp,color: AppColors.iconColor2,text: "32min",),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

