import 'package:fooderlich/models/models.dart';

class ExploreData {
  final List<ExploreRecipe> todayRecipes;
  final List<Post> friendPosts;

  ExploreData({
    required this.todayRecipes,
    required this.friendPosts,
  });
}
