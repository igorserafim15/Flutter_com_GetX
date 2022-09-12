import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/app_data.dart';
import 'package:flutter_com_getx/app/globals/cart_model.dart';
import 'package:flutter_com_getx/app/globals/custom/custom.dart';
import 'package:flutter_com_getx/app/globals/utils/utils.dart';

import 'widgets/cart_tile.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final Helps helps = Helps();

  void removeItemFromCart(CartModel cart) {
    setState(() => cartList.remove(cart));
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in cartList) {
      total += item.totalPrice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Carrinho')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartList.length,
              itemBuilder: (_, i) => CartTile(
                cartItem: cartList[i],
                remove: removeItemFromCart,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total',
                  style: CustomStyle.title,
                ),
                Text(
                  helps.priceToCurrency(cartTotalPrice()),
                  style: CustomStyle.price,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    bool? result = await showOrderConfirmation();
                    if (result == null) return;
                    if (result) debugPrint('$result');
                  },
                  child: const Text('Concluir pedido'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente confirmar o pedido?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Não'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
