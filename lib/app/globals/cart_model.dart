import 'package:flutter_com_getx/app/globals/item_model.dart';

class CartModel {
  ItemModel item;
  int quantity;

  CartModel({
    required this.item,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;
}
