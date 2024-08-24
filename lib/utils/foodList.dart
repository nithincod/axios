class FoodList {
  final int id;
  final String name;
  final String foodCategory;

  FoodList({
    required this.id,
    required this.name,
    required this.foodCategory,
  });

  List<FoodList> foodList() {
    return [
      FoodList(id: 1, name: 'Apple', foodCategory: 'Fruit'),
      FoodList(id: 2, name: 'Banana', foodCategory: 'Fruit'),
      FoodList(id: 3, name: 'Orange', foodCategory: 'Fruit'),
      FoodList(id: 4, name: 'Pineapple', foodCategory: 'Fruit'),
      FoodList(id: 5, name: 'Strawberry', foodCategory: 'Fruit'),
      FoodList(id: 6, name: 'Grapes', foodCategory: 'Fruit'),
      FoodList(id: 7, name: 'Watermelon', foodCategory: 'Fruit'),
      FoodList(id: 8, name: 'Mango', foodCategory: 'Fruit'),
      FoodList(id: 9, name: 'Peach', foodCategory: 'Fruit'),
      FoodList(id: 10, name: 'Pear', foodCategory: 'Fruit'),
      FoodList(id: 11, name: 'Plum', foodCategory: 'Fruit'),
      FoodList(id: 12, name: 'Cherry', foodCategory: 'Fruit'),
      FoodList(id: 13, name: 'Kiwi', foodCategory: 'Fruit'),
      FoodList(id: 14, name: 'Pomegranate', foodCategory: 'Fruit'),
      FoodList(id: 15, name: 'Blueberry', foodCategory: 'Fruit'),
      FoodList(id: 16, name: 'Raspberry', foodCategory: 'Fruit'),
      FoodList(id: 17, name: 'Blackberry', foodCategory: 'Fruit'),
      FoodList(id: 18, name: 'Cranberry', foodCategory: 'Fruit'),
      FoodList(id: 19, name: 'Gooseberry', foodCategory: 'Fruit'),
      FoodList(id: 20, name: 'Apricot', foodCategory: 'Fruit'),
      FoodList(id: 21, name: 'Lemon', foodCategory: 'Fruit'),
      FoodList(id: 22, name: 'Lime', foodCategory: 'Fruit'),
      FoodList(id: 23, name: 'Coconut', foodCategory: 'Fruit'),
    ];
  }
}
