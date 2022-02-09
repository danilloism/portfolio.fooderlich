part of 'grocery_page.dart';

class GroceryListPage extends StatelessWidget {
  const GroceryListPage({
    Key? key,
    required this.manager,
  }) : super(key: key);

  final GroceryManager manager;
  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: PaddingEdgeInsets.all16,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return InkWell(
            child: GroceryTile(
              key: Key(item.id),
              item: item,
              onComplete: (change) {
                if (change != null) {
                  manager.completeItem(index, change);
                }
              },
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroceryItemPage.update(
                    onUpdate: (item) {
                      manager.updateItem(item, index);
                    },
                    originalItem: item),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Gap.h16,
        itemCount: groceryItems.length,
      ),
    );
  }
}
