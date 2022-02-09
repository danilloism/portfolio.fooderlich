import 'package:flutter/material.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/pages/grocery_item_page.dart';
import 'package:fooderlich/utils.dart';
import 'package:provider/provider.dart';

part 'empty_grocery_page.dart';
part 'grocery_list_page.dart';

class GroceryPage extends StatelessWidget {
  const GroceryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemPage.create(
                onCreate: (item) {
                  manager.addItem(item);
                  //Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
      body: _buildGroceryScreen(),
    );
  }

  Widget _buildGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: (context, manager, child) {
        if (manager.groceryItems.isNotEmpty) {
          return GroceryListPage(manager: manager);
        } else {
          return const _EmptyGroceryScreen();
        }
      },
    );
  }
}
