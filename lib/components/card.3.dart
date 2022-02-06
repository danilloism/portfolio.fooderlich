import 'package:flutter/material.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/theme.dart';
import 'package:fooderlich/utils.dart';

class Card3 extends StatelessWidget {
  const Card3({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final ExploreRecipe recipe;

  List<Widget> createTagChips() {
    final chips = <Widget>[];
    recipe.tags.take(6).forEach((element) {
      final chip = Chip(
        label: Text(
          element,
          style: FooderlichTheme.dark.textTheme.bodyText1,
        ),
        backgroundColor: Colors.black.withOpacity(0.7),
      );
      chips.add(chip);
    });

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: const [
            BoxShadow(blurRadius: 5),
          ],
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  Gap.h8,
                  Text(
                    recipe.title,
                    style: FooderlichTheme.dark.textTheme.headline2,
                  ),
                  Gap.h32,
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 12,
                    children: createTagChips()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
