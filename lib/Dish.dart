class Dish {
  String? image;
  String? name;
  double? price;

  Dish({
    this.image,
    this.name,
    this.price,
  });
}

List<Dish> recommendedDishes = [
  Dish(
    image: 'assets/dish1.png',
    name: '   Veggie \ntomato mix',
    price: 1.900,
  ),
  Dish(
    image: 'assets/dish2.png',
    name: '   Veggie \ntomato mix',
    price: 2.300,
  ),
  Dish(
    image: 'assets/dish3.png',
    name: '   Veggie \ntomato mix',
    price: 2.100,
  ),
  Dish(
    image: 'assets/dish4.png',
    name: '   Veggie \ntomato mix',
    price: 3.900,
  ),
  Dish(
    image: 'assets/dish5.png',
    name: '   Veggie \ntomato mix',
    price: 1.500,
  ),
];

List<Dish> favouriteDishes = [
  Dish(
    image: 'assets/meal3.jpg',
    name: '   Veggie \ntomato mix',
    price: 1.900,
  ),
  Dish(
    image: 'assets/meal2.jpg',
    name: '   Veggie \ntomato mix',
    price: 1.900,
  ),
  Dish(
    image: 'assets/meal1.jpg',
    name: '   Veggie \ntomato mix',
    price: 1.900,
  ),
];
