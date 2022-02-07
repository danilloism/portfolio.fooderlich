import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/utils.dart';
import 'package:provider/provider.dart';

part 'empty_grocery_page.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: add a Scaffold widget
    return const EmptyGroceryScreen();
  }
  //TODO: add buildGroceryScreen
}
