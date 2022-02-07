import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';

class GroceryTile extends StatelessWidget {
  GroceryTile({Key? key, required this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    //TODO: change this widget
    return Container(
      height: 100,
      color: Colors.red,
    );
  }

// TODO: Add BuildImportance()

// TODO: Add buildDate()

// TODO: Add buildCheckbox()
}
