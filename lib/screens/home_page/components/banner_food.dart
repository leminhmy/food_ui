import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_ui/components/dimensions.dart';
import 'package:food_ui/utils/colors.dart';

import 'banner_card.dart';

class BannerFood extends StatefulWidget {
  const BannerFood({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerFood> createState() => _BannerFoodState();
}

class _BannerFoodState extends State<BannerFood> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bannerWidget(),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    );
  }

  bannerWidget() {
    return SizedBox(
      height: Dimensions.pageView,
      child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return BannerCard(
              index: index,
              currPageValue: _currPageValue,
              height: Dimensions.pageViewContainer,
            );
          }),
    );
  }
}
