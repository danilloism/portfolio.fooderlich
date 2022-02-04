import 'package:flutter/material.dart';
import 'package:fooderlich/home.dart';
import 'package:fooderlich/theme.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fooderlich',
      debugShowCheckedModeBanner: false,
      theme: FooderlichTheme.light,
      home: const Home(),
    );
  }
}
