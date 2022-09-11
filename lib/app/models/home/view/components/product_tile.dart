import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/custom.dart';
import 'package:flutter_com_getx/app/globals/item_model.dart';
import 'package:flutter_com_getx/app/utils/utils.dart';
import 'package:flutter_com_getx/app/models/product/view/product_view.dart';

class ProductTile extends StatelessWidget {
  final ItemModel item;

  ProductTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Helps helps = Helps();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProductView(item: item),
        ),
      ),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Hero(
                  tag: item.imgUrl,
                  child: Image.asset(item.imgUrl),
                ),
              ),
              Text(
                item.itemName,
                style: CustomStyle.title,
              ),
              Row(
                children: [
                  Text(
                    helps.priceToCurrency(item.price),
                    style: CustomStyle.price,
                  ),
                  Text('/${item.unit}'),
                ],
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Adicionar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
