import 'package:get/get.dart';

import '../models/show_model.dart';
import '../services/api_service.dart';
import '../services/favorite_service.dart';
import 'favorite_controller.dart';

class DetailController extends GetxController {
  final apiService = ApiService();
  final favoriteService = FavoriteService();

  final isLoading = true.obs;
  final show = Rxn<ShowModel>();
  final isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    final id = Get.arguments as int;
    loadDetail(id);
  }

  Future<void> loadDetail(int id) async {
    try {
      isLoading.value = true;
      final result = await apiService.fetchShowDetail(id);
      show.value = result;
      isFavorite.value = favoriteService.isFavorite(id);
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat detail');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> toggleFavorite() async {
    final current = show.value;
    if (current == null) return;

    if (isFavorite.value) {
      await favoriteService.removeFavorite(current.id);
      isFavorite.value = false;
      Get.snackbar('Favorit', 'Show dihapus dari favorit');
    } else {
      await favoriteService.addFavorite(current);
      isFavorite.value = true;
      Get.snackbar('Favorit', 'Show ditambahkan ke favorit');
    }

    if (Get.isRegistered<FavoriteController>()) {
      Get.find<FavoriteController>().loadFavorites();
    }
  }
}
