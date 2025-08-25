import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_6/features/home/providers/home_state.dart';
import 'package:assignment_6/features/models/item_model.dart';

class HomeNotifier extends StateNotifier<HomeStates> {
  List<FoodModel> food = [];
  Set<int> selectedIndexes = {};
  List<FoodModel> cart = [];
  HomeNotifier() : super(LoadingFood()) {
    loadingFood();
  }

  Future<void> loadingFood() async {
    await Future.delayed(Duration(seconds: 2));
    food = [
      FoodModel(
        name: "Tuna Fish",
        price: 30.0,
        image: "lib/assets/images/tuna.png",
        category: "Seafood",
      ),
      FoodModel(
        name: "Rice & Bread",
        price: 24.0,
        image: "lib/assets/images/rice_and_bread.png",
        category: "Staple",
      ),
      FoodModel(
        name: "Eggs Celery",
        price: 12.0,
        image: "lib/assets/images/eggs_celery.png",
        category: "Healthy",
      ),
      FoodModel(
        name: "Herby Veg",
        price: 18.0,
        image: "lib/assets/images/herby_veg.png",
        category: "Veg",
      ),

      FoodModel(
        name: "Kebabs",
        price: 35.0,
        image: "lib/assets/images/kebabs.png",
        category: "Indian",
      ),
      FoodModel(
        name: "Penne Pasta",
        price: 28.0,
        image: "lib/assets/images/penne_pasta.png",
        category: "Indian",
      ),
    ];

    state = LoadedFood();
  }

 void toggleItemSelection(int index) {
    if (selectedIndexes.contains(index)) {
      selectedIndexes.remove(index);
      cart.remove(food[index]);
    } else {
      selectedIndexes.add(index);
      cart.add(food[index]);
    }

    state = LoadedFood();
  }

  bool isSelected(int index) {
    return selectedIndexes.contains(index);
  }
}

final foodProvider = StateNotifierProvider<HomeNotifier, HomeStates>((ref) {
  return HomeNotifier();
});
