import 'package:flutter/material.dart';
import 'package:food_ui/controllers/cart_controller.dart';
import 'package:get/get.dart';

import 'cart_item.dart';

class ListCart extends StatelessWidget {
  const ListCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartController) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: List.generate(cartController.getItems.length, (index) => CartItem(cartModel: cartController.getItems[index]),
            ),
          ),
        );
      }
    );
  }
}

