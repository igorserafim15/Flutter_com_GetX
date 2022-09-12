import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final String category;
  final bool isSelected;

  const CategoryComponent({
    Key? key,
    required this.category,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(category),
      ),
    );
  }
}