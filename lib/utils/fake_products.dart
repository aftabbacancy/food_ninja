import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ninja/apis/restaurants/all.dart';
import 'package:food_ninja/models/product.dart';
import 'package:food_ninja/models/restaurant.dart';

class FakeProducts {
  List<Product> getProductsList() {
    return popularMenus;
  }

  List<Product> getPopularMenu() {
    return popularMenus;
  }

  List<Restaurant> getNearestRestaurant() {
    return restaurants;
  }
}

final productsProvider = Provider<FakeProducts>((ref) {
  return FakeProducts();
});
