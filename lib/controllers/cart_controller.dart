import 'package:food_ui/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int,CartModel> _items ={};

  void addItem(ProductsModel product, int quantity){
    _items.putIfAbsent(product.id!, () {
      print("adding item to the cart id "+product.id!.toString() +"quantity "+quantity.toString());
     return CartModel(
      id: product.id,
      name: product.name,
      price: product.price,
      img: product.img,
      quantity: quantity,
      isExist: true,
      time: DateTime.now().toString(),
    );
    });
  }
}