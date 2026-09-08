import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavoriteStatus(Meal meal) {
    if(state.contains(meal)) {
      state = state.where((element) => element.id != meal.id).toList()
    } else  {
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider
<FavoriteMealsNotifier, List<Meal>>
((ref) {
  return FavoriteMealsNotifier();
});
