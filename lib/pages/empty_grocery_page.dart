part of 'grocery_page.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

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
          //TOTO: add empty screen subtitle
          //TOTO: add browse recipes button
        ],
      ),
    );
  }
}
