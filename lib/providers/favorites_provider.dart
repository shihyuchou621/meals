import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

// 需用Notifier結尾
class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      // 不可直接改變state，例如add、remove等，必須重新賦值
      // state = List.from(state)..remove(meal);
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // state = List.from(state)..add(meal);
      state = [...state, meal];
      return true;
    }
  }
}

// 內容會改變的話要用StateNotifierProvider
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref) {
  return FavoriteMealNotifier();
});
