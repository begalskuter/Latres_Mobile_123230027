import 'package:get/get.dart';

import '../models/show_model.dart';
import '../services/favorite_service.dart';

class FavoriteController extends GetxController {
  final favoriteService = FavoriteService();
  final favorites = <ShowModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    favorites.value = favoriteService.getFavorites();
  }

  Future<void> removeFavorite(int id) async {
    await favoriteService.removeFavorite(id);
    loadFavorites();
  }
}
