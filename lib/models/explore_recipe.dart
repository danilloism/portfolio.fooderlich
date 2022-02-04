part 'ingredient.dart';
part 'instruction.dart';

class RecipeCardType {
  static const card1 = 'card1';
  static const card2 = 'card2';
  static const card3 = 'card3';
}

class ExploreRecipe {
  final String id;
  final String cardType;
  final String title;
  String subtitle;
  String backgroundImage;
  String backgroundImageSource;
  String message;
  String authorName;
  String role;
  String profileImage;
  int durationInMinutes;
  String dietType;
  int calories;
  List<String> tags;
  String description;
  String source;
  List<Ingredients> ingredients;
  List<Instruction> instructions;

  ExploreRecipe({
    required this.id,
    required this.cardType,
    required this.title,
    this.subtitle = '',
    this.backgroundImage = '',
    this.backgroundImageSource = '',
    this.message = '',
    this.authorName = '',
    this.role = '',
    this.profileImage = '',
    this.durationInMinutes = 0,
    this.dietType = '',
    this.calories = 0,
    this.tags = const [],
    this.description = '',
    this.source = '',
    this.ingredients = const <Ingredients>[],
    this.instructions = const <Instruction>[],
  });

  factory ExploreRecipe.fromJson(Map<String, dynamic> json) {
    final ingredients = <Ingredients>[];
    final instructions = <Instruction>[];

    json['ingredients'].forEach((v) {
      ingredients.add(Ingredients.fromJson(v));
    });

    json['instructions'].forEach((v) {
      instructions.add(Instruction.fromJson(v));
    });

    return ExploreRecipe(
      id: json['id'] as String,
      cardType: json['cardType'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      backgroundImage: json['backgroundImage'] as String,
      backgroundImageSource: json['backgroundImageSource'] as String,
      message: json['message'] as String,
      authorName: json['authorName'] as String,
      role: json['role'] as String,
      profileImage: json['profileImage'] as String,
      durationInMinutes: json['durationInMinutes'] as int,
      dietType: json['dietType'] as String,
      calories: json['calories'] as int,
      tags: json['tags'].cast<String>() as List<String>,
      description: json['description'] as String,
      source: json['source'] as String,
      ingredients: ingredients,
      instructions: instructions,
    );
  }
}
