import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/custom.dart';
import 'package:flutter_com_getx/app/globals/app_data.dart';
import 'package:flutter_com_getx/app/models/home/view/components/category.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Loja'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, right: 16),
            child: Text('5'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Pesquisar',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: CustomPadding.padding_4),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) => CategoryComponent(
                    category: categories[i], isSelected: true),
              ),
            ),
            SizedBox(height: CustomPadding.padding_4),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: items.length,
                itemBuilder: (_, i) {
                  return Container(color: Colors.red);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
