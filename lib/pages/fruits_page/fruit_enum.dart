enum Fruit { apple, banana, mango }

extension FruitName on Fruit {
  String get fruitName {
    return switch (this) {
      Fruit.apple => "Apple",
      Fruit.banana => "Banana",
      Fruit.mango => "Mango",
    };
  }

  String get fruitIcon {
    return switch (this) {
      Fruit.apple => "🍎",
      Fruit.banana => "🍌",
      Fruit.mango => "🥭",
    };
  }
}
