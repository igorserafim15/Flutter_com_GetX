import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/modules/cart/view/cart_view.dart';
import 'package:flutter_com_getx/app/modules/home/view/home_view.dart';
import 'package:flutter_com_getx/app/modules/order/view/order_view.dart';
import 'package:flutter_com_getx/app/modules/profile/view/profile_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentView = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeView(),
          CartView(),
          OrderView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentView,
        onTap: (i) => setState(() {
          currentView = i;
          pageController.jumpToPage(i);
        }),
        type: BottomNavigationBarType.fixed,
        items: items,
      ),
    );
  }
}

List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart_outlined),
    label: 'Carrinho',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.list),
    label: 'Pedidos',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.person_outline),
    label: 'Perfil',
  ),
];
