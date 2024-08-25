class Food {
  final int id;
  final String name;
  final String foodCategory;
  final int calories;
  final double protein; 
  final double carbs;  
  final double fats;    
  final String image;   

  Food({
    required this.id,
    required this.name,
    required this.foodCategory,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.image,
  });

  static List<Food> getFoodList() {
    return [
      // Fast Foods
      Food(
        id: 24,
        name: 'Burger',
        foodCategory: 'Fast Food',
        calories: 225,
        protein: 12.0,
        carbs: 32.0,
        fats: 9.0,
        image: 'images/burger.png',
      ),
      Food(
        id: 25,
        name: 'Pizza',
        foodCategory: 'Fast Food',
        calories: 225,
        protein: 10.0,
        carbs: 30.0,
        fats: 10.0,
        image: 'images/pizza.png',
      ),
      Food(
        id: 26,
        name: 'Fried Chicken',
        foodCategory: 'Fast Food',
        calories: 320,
        protein: 25.0,
        carbs: 15.0,
        fats: 20.0,
        image: 'images/fried_chicken.png',
      ),
      Food(
        id: 27,
        name: 'Hot Dog',
        foodCategory: 'Fast Food',
        calories: 150,
        protein: 5.0,
        carbs: 2.0,
        fats: 12.0,
        image: 'images/hot_dog.png',
      ),
      Food(
        id: 28,
        name: 'French Fries',
        foodCategory: 'Fast Food',
        calories: 365,
        protein: 4.0,
        carbs: 63.0,
        fats: 17.0,
        image: 'images/french_fries.png',
      ),

      // Dinner Items
      Food(
        id: 29,
        name: 'Grilled Salmon',
        foodCategory: 'Dinner',
        calories: 232,
        protein: 25.0,
        carbs: 0.0,
        fats: 14.0,
        image: 'images/grilled_salmon.png',
      ),
      Food(
        id: 30,
        name: 'Steak',
        foodCategory: 'Dinner',
        calories: 242,
        protein: 26.0,
        carbs: 0.0,
        fats: 15.0,
        image: 'images/steak.png',
      ),
      Food(
        id: 31,
        name: 'Pasta',
        foodCategory: 'Dinner',
        calories: 200,
        protein: 8.0,
        carbs: 42.0,
        fats: 1.0,
        image: 'images/pasta.png',
      ),
      Food(
        id: 32,
        name: 'Vegetable Stir Fry',
        foodCategory: 'Dinner',
        calories: 150,
        protein: 5.0,
        carbs: 30.0,
        fats: 5.0,
        image: 'images/vegetable_stir_fry.png',
      ),
      Food(
        id: 33,
        name: 'Chicken Curry',
        foodCategory: 'Dinner',
        calories: 350,
        protein: 30.0,
        carbs: 20.0,
        fats: 15.0,
        image: 'images/chicken_curry.png',
      ),

      // Fruits
      Food(
        id: 1,
        name: 'Apple',
        foodCategory: 'Fruit',
        calories: 52,
        protein: 0.3,
        carbs: 14.0,
        fats: 0.2,
        image: 'images/apple.png',
      ),
      Food(
        id: 2,
        name: 'Banana',
        foodCategory: 'Fruit',
        calories: 89,
        protein: 1.1,
        carbs: 23.0,
        fats: 0.3,
        image: 'images/banana.png',
      ),
      Food(
        id: 3,
        name: 'Orange',
        foodCategory: 'Fruit',
        calories: 47,
        protein: 0.9,
        carbs: 12.0,
        fats: 0.1,
        image: 'images/orange.png',
      ),
      Food(
        id: 4,
        name: 'Pineapple',
        foodCategory: 'Fruit',
        calories: 50,
        protein: 0.5,
        carbs: 13.0,
        fats: 0.1,
        image: 'images/pineapple.png',
      ),
      Food(
        id: 5,
        name: 'Strawberry',
        foodCategory: 'Fruit',
        calories: 32,
        protein: 0.7,
        carbs: 7.7,
        fats: 0.3,
        image: 'images/strawberry.png',
      ),
      
    ];
  }
}