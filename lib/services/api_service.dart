import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/show_model.dart';

class ApiService {
  static const String _baseUrl = 'https://api.tvmaze.com';

  Future<List<ShowModel>> fetchShows() async {
    final response = await http.get(Uri.parse('$_baseUrl/shows'));
    if (response.statusCode != 200) {
      throw Exception('Gagal memuat data show');
    }
    final data = jsonDecode(response.body) as List;
    return data.map((e) => ShowModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<ShowModel> fetchShowDetail(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/shows/$id'));
    if (response.statusCode != 200) {
      throw Exception('Gagal memuat detail show');
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return ShowModel.fromJson(data);
  }
}
