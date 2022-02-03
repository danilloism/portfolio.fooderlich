import 'package:flutter/material.dart';
import 'package:fooderlich/cards/card.author.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag5.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: const [
            AuthorCard(
              authorName: 'Danillo Ilggner',
              title: 'Computer Science Student',
              imageProvider: AssetImage('assets/danillo.jpeg'),
            ), //TODO: add Positioned text
          ],
        ),
      ),
    );
  }
}
