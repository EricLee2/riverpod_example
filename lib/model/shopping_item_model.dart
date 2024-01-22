class ShoppingItemModel {
  final String name;
  final int quantity;
  bool hasBought;
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  void toggleHasBought() {
    hasBought = !hasBought;
    // state = state
    //     .map((e) => e.name == name
    //     ? ShoppingItemModel(
    //     name: e.name,
    //     quantity: e.quantity,
    //     hasBought: !e.hasBought,
    //     isSpicy: e.isSpicy)
    //     : e)
    //     .toList();
  }
}
