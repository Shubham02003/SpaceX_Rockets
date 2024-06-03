import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'package:space_x/models/rocket_model.dart';

class ApiService {
  final baseUrl = FlutterConfig.get('BASE_URL');

  Future<List<Rocket>> fetchRockets() async {
    final response = await http.get(Uri.parse(baseUrl as String));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Rocket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rockets');
    }
  }
}
