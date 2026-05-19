import 'package:get/get.dart';
import '../models/show_model.dart';
import '../services/api_service.dart';
import '../routes/app_routes.dart';

class HomeController extends GetxController {
  final apiService = ApiService();

  final shows = <ShowModel>[].obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchShows();
  }

  Future<void> fetchShows() async {
    try {
      isLoading.value = true;
      shows.value = await apiService.fetchShows();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mengambil data show');
    } finally {
      isLoading.value = false;
    }
  }

  void openDetail(int id) {
    Get.toNamed(AppRoutes.detail, arguments: id);
  }
}
