import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_6/features/home/providers/home_state.dart';
import 'package:assignment_6/features/models/item_model.dart';

class HomeNotifier extends StateNotifier<HomeStates> {
  List<FoodModel> food = [];
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
        isSelected: false,
      ),
      FoodModel(
        name: "Rice & Bread",
        price: 24.0,
        image: "lib/assets/images/rice_and_bread.png",
        category: "Staple",
        isSelected: false,
      ),
      FoodModel(
        name: "Eggs Celery",
        price: 12.0,
        image: "lib/assets/images/eggs_celery.png",
        category: "Healthy",
        isSelected: false,
      ),
      FoodModel(
        name: "Herby Veg",
        price: 18.0,
        image: "lib/assets/images/herby_veg.png",
        category: "Veg",
        isSelected: false,
      ),

      FoodModel(
        name: "Kebabs",
        price: 35.0,
        image: "lib/assets/images/kebabs.png",
        category: "Indian",
        isSelected: false,
      ),
      FoodModel(
        name: "Penne Pasta",
        price: 28.0,
        image: "lib/assets/images/penne_pasta.png",
        category: "Indian",
        isSelected: false,
      ),
      FoodModel(
        name: "Caesar Salad",
        price: 15.0,
        image: "lib/assets/images/tuna.png",
        category: "Salad",
        isSelected: false,
      ),
      FoodModel(
        name: "Pepperoni Pizza",
        price: 40.0,
        image: "lib/assets/images/tuna.png",
        category: "Pizza",
        isSelected: false,
      ),
      FoodModel(
        name: "Cold Coffee",
        price: 10.0,
        image: "lib/assets/images/tuna.png",
        category: "Beverage",
        isSelected: false,
      ),
      FoodModel(
        name: "Chocolate Lava Cake",
        price: 20.0,
        image: "lib/assets/images/tuna.png",
        category: "Dessert",
        isSelected: false,
      ),
    ];

    state = LoadedFood();
  }

  void selectedItem(FoodModel food) {
    cart.add(food);
  }

  void discardedItem(FoodModel food) {
    cart.remove(food);
  }
}

final foodProvider = StateNotifierProvider<HomeNotifier, HomeStates>((ref) {
  return HomeNotifier();
});
