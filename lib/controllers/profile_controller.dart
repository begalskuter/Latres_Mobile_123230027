import 'package:get/get.dart';
import '../services/auth_service.dart';

class ProfileController extends GetxController {
  final authService = AuthService();
  final username = '-'.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  Future<void> loadProfile() async {
    username.value = await authService.getUsername();
  }

  Future<void> logout() async {
    await authService.logout();
    Get.offAllNamed('/login');
  }
}
