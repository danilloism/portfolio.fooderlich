import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key})
      : category = "Editor's Choice",
        title = "The Art of Dough",
        description = "Learn to make the perfect bread.",
        chef = "Danillo Ilggner",
        super(key: key);

  final String category;
  final String title;
  final String description;
  final String chef;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag1.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Text(
              category,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Positioned(
              top: 20,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                chef,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
