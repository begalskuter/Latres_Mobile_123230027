import 'package:hive/hive.dart';
import '../models/show_model.dart';

class FavoriteService {
  static const String boxName = 'favorites';

  Box get _box => Hive.box(boxName);

  List<ShowModel> getFavorites() {
    return _box.values
        .map((e) => ShowModel.fromFavorite(Map<dynamic, dynamic>.from(e)))
        .toList();
  }

  bool isFavorite(int id) => _box.containsKey(id.toString());

  Future<void> addFavorite(ShowModel show) async {
    await _box.put(show.id.toString(), show.toFavoriteMap());
  }

  Future<void> removeFavorite(int id) async {
    await _box.delete(id.toString());
  }
}
