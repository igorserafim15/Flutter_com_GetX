import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/cart_model.dart';
import 'package:flutter_com_getx/app/globals/utils/utils.dart';
import 'package:flutter_com_getx/app/globals/widgets/quantity_component.dart';

class CartTile extends StatefulWidget {
  final CartModel cartItem;
  final Function(CartModel) remove;

  const CartTile({Key? key, required this.cartItem, required this.remove})
      : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final Helps helps = Helps();

  @override
  Widget build(BuildContext context) {
    final item = widget.cartItem.item;
    return Card(
      margin: const EdgeInsets.all(6),
      child: ListTile(
        leading: Image.asset(
          item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(item.itemName),
        subtitle: Text(helps.priceToCurrency(widget.cartItem.totalPrice())),
        trailing: QuantityComponent(
          unit: item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if(quantity == 0) widget.remove(widget.cartItem);
            });
          },
          isRemovable: true,
        ),
        onTap: () {},
      ),
    );
  }
}
