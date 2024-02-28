import 'package:flutter/material.dart';

class ViewSellProduct extends StatefulWidget {
  final String name;
  final double unitPrice;
  int quantity;
  // final Function() onIncreaseQuantity;
  // final Function() onDecreaseQuantity;
  final String code;
  ViewSellProduct({
    super.key,
    required this.code,
    required this.name,
    required this.unitPrice,
    required this.quantity,
    // required this.onIncreaseQuantity,
    // required this.onDecreaseQuantity,
  });

  @override
  _ViewSellProductState createState() => _ViewSellProductState();
}

class _ViewSellProductState extends State<ViewSellProduct> {
  // final int _quantity = 0;
  void onIncreaseQuantity() {
    setState(() {
      widget.quantity++;
    });
  }

  void onDecreaseQuantity() {
    setState(() {
      if (widget.quantity > 0) {
        widget.quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                  // const SizedBox(height: 8.0),
                  // Text('P. Unit $widget.unitPrice.toString()'),
                  Text(
                    'P. Unit ${widget.unitPrice.toString()}',
                    style: const TextStyle(fontSize: 11.0),
                  ),
                  // const SizedBo x(height: 8.0),
                  // Text((widget.quantity * widget.unitPrice).toString()),
                  Text(
                    'Total ${widget.quantity * widget.unitPrice}',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: onDecreaseQuantity,
                      ),
                      Text(widget.quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add_circle),
                        onPressed: onIncreaseQuantity,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
