import 'package:flutter/material.dart';

class QuantityComponent extends StatelessWidget {
  final String unit;
  final int value;
  final Function(int quantity) result;
  final bool isRemovable;

  const QuantityComponent({
    Key? key,
    required this.unit,
    required this.value,
    required this.result,
    this.isRemovable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            if (value == 1 && !isRemovable) return;
            int resultCount = value - 1;
            result(resultCount);
          },
          icon: !isRemovable || value > 1
              ? const Icon(Icons.remove)
              : const Icon(Icons.delete_outline),
        ),
        Text('$value$unit'),
        IconButton(
          onPressed: () {
            int resultCount = value + 1;
            result(resultCount);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
