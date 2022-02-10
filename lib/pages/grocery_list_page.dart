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
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50,
              ),
            ),
            onDismissed: (direction) {
              manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.name} dismissed'),
                ),
              );
            },
            child: InkWell(
              child: GroceryTile(
                item: item,
                key: Key(item.id),
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
            ),
          );
        },
        separatorBuilder: (context, index) => Gap.h16,
        itemCount: groceryItems.length,
      ),
    );
  }
}
