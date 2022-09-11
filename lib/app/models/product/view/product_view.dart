import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/custom.dart';
import 'package:flutter_com_getx/app/globals/item_model.dart';
import 'package:flutter_com_getx/app/utils/utils.dart';
import 'package:flutter_com_getx/app/models/components/quantity_component.dart';

class ProductView extends StatefulWidget {
  final ItemModel item;

  const ProductView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int cartItemQuantity = 1;
  final Helps helps = Helps();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.itemName)),
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: widget.item.imgUrl,
              child: Image.asset(widget.item.imgUrl),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.itemName,
                              style: CustomStyle.title,
                            ),
                            Text(
                              helps.priceToCurrency(widget.item.price),
                              style: CustomStyle.price,
                            ),
                          ],
                        ),
                        QuantityComponent(
                          unit: widget.item.unit,
                          value: cartItemQuantity,
                          result: (quantity) {
                            setState(() => cartItemQuantity = quantity);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(widget.item.description),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Adicionar ao carrinho'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
