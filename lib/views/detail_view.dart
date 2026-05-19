import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: const Color(0xFF050505),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final show = controller.show.value;
        if (show == null) {
          return const Center(child: Text('Data tidak ditemukan'));
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: show.imageUrl.isEmpty
                      ? Container(height: 320, color: Colors.grey.shade800)
                      : CachedNetworkImage(
                          imageUrl: show.imageUrl,
                          height: 320,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(height: 16),
                Text(show.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(show.rating > 0 ? show.rating.toString() : '-'),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: show.genres.map((g) => Chip(label: Text(g))).toList(),
                ),
                const SizedBox(height: 16),
                const Text('Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Html(data: show.summary.isEmpty ? '<p>Tidak ada ringkasan.</p>' : show.summary),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Obx(() => ElevatedButton.icon(
                    onPressed: controller.toggleFavorite,
                    icon: Icon(controller.isFavorite.value ? Icons.favorite : Icons.favorite_border),
                    label: Text(controller.isFavorite.value ? 'Hapus Favorit' : 'Tambah Favorit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE74C3C),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                  )),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
