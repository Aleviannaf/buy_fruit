import 'package:buy_fruit/data/dummy_data.dart';
import 'package:buy_fruit/models/product.dart';
import 'package:flutter/widgets.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = dummyProducts;
  bool _showFavoriteOnly = false;

  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((prod) => prod.isFavorite).toList();
    }
    return [..._items];
  }

  void showFAvoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }
   int get itemCount {
    return _items.length;
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
