import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
        (ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super([
          ShoppingItemModel(
              name: 'kimchi', quantity: 3, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: 'ramen', quantity: 30, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: 'samkyup', quantity: 1, hasBought: false, isSpicy: false),
          ShoppingItemModel(
              name: 'Buldakk', quantity: 5, hasBought: false, isSpicy: true),
          ShoppingItemModel(
              name: 'subak', quantity: 2, hasBought: false, isSpicy: false),
        ]);

  void toggleHasBought({required String name}) {
    ShoppingItemModel? model;

    // state.map((e) => e.name == name ? model = e : e);
    // model?.toggleHasBought();

    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy)
            : e)
        .toList();
  }
}
