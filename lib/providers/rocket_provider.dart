import 'package:flutter/material.dart';
import 'package:space_x/models/rocket_model.dart';
import 'package:space_x/services/api_services.dart';

class RocketProvider extends ChangeNotifier {
  List<Rocket> _rockets = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Rocket> get rockets => _rockets;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchRockets() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();
    try {
      _rockets = await ApiService().fetchRockets();
    } catch (e) {
      _errorMessage = 'Failed to load rockets';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
