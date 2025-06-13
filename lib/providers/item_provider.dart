import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/api_service.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [];
  bool _isLoading = false;

  List<Item> get items => _items;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> loadItems() async {
    _isLoading = true;
    notifyListeners();

    try {
      _items = await _apiService.fetchItems();
    } catch (e) {
      _items = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Item getById(int id) => _items.firstWhere((item) => item.id == id);
}
