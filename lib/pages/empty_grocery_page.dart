part of 'grocery_page.dart';

class _EmptyGroceryScreen extends StatelessWidget {
  const _EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingEdgeInsets.all32,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/fooderlich_assets/empty_list.png'),
            ),
          ),
          const Text(
            'No Groceries',
            style: TextStyle(fontSize: 21),
          ),
          Gap.h16,
          const Text(
            'Shopping for ingredients?\n'
            'Tap the + button to write them down!',
            textAlign: TextAlign.center,
          ),
          Gap.h8,
          MaterialButton(
            textColor: Colors.white,
            child: const Text('Browse Recipes'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: Colors.green,
            onPressed: () => Provider.of<TabManager>(
              context,
              listen: false,
            ).goToRecipes(),
          ),
        ],
      ),
    );
  }
}
