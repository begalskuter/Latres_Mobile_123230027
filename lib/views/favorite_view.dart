import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorite_controller.dart';
import '../routes/app_routes.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Favorit'),
        backgroundColor: const Color(0xFF050505),
      ),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(child: Text('Belum ada favorit'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: controller.favorites.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = controller.favorites[index];
            return GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.detail, arguments: item.id),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF121212),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: item.imageUrl.isEmpty
                        ? Container(width: 60, height: 60, color: Colors.grey.shade800)
                        : CachedNetworkImage(
                            imageUrl: item.imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                  ),
                  title: Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(item.rating > 0 ? item.rating.toString() : '-'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                    onPressed: () => controller.removeFavorite(item.id),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
