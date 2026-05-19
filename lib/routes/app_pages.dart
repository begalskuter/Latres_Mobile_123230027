import 'package:get/get.dart';

import '../views/detail_view.dart';
import '../views/login_view.dart';
import '../views/main_view.dart';
import '../controllers/detail_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/main_controller.dart';
import '../controllers/favorite_controller.dart';
import '../controllers/profile_controller.dart';
import '../views/favorite_view.dart';
import '../views/home_view.dart';
import '../views/profile_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MainController>(() => MainController());
        Get.lazyPut<HomeController>(() => HomeController());
        Get.lazyPut<FavoriteController>(() => FavoriteController());
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
      children: [
        GetPage(name: '/home', page: () => const HomeView()),
        GetPage(name: '/favorite', page: () => const FavoriteView()),
        GetPage(name: '/profile', page: () => const ProfileView()),
      ],
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DetailController>(() => DetailController());
      }),
    ),
  ];
}
