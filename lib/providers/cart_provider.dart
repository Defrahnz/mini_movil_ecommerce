import 'package:flutter/material.dart';
import '../models/producto.dart';

class CartProvider with ChangeNotifier {
  final List<Producto> _cartItems = [];

  List<Producto> get cartItems => _cartItems;

  void addToCart(Producto producto) {
    _cartItems.add(producto);
    notifyListeners();
  }

  void removeFromCart(Producto producto) {
    _cartItems.remove(producto);
    notifyListeners();
  }
  
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}