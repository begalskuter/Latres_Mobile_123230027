class ShowModel {
  final int id;
  final String name;
  final String imageUrl;
  final double rating;
  final List<String> genres;
  final String summary;

  ShowModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.genres,
    required this.summary,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    final image = json['image'];
    final ratingObj = json['rating'];
    final listGenres = (json['genres'] as List?)?.map((e) => e.toString()).toList() ?? [];
    return ShowModel(
      id: json['id'] ?? 0,
      name: (json['name'] ?? '').toString(),
      imageUrl: (image?['original'] ?? image?['medium'] ?? '').toString(),
      rating: (ratingObj?['average'] ?? 0).toDouble(),
      genres: listGenres,
      summary: (json['summary'] ?? '').toString(),
    );
  }

  factory ShowModel.fromFavorite(Map<dynamic, dynamic> json) {
    return ShowModel(
      id: json['id'] ?? 0,
      name: (json['name'] ?? '').toString(),
      imageUrl: (json['imageUrl'] ?? '').toString(),
      rating: (json['rating'] ?? 0).toDouble(),
      genres: (json['genres'] as List?)?.map((e) => e.toString()).toList() ?? [],
      summary: (json['summary'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toFavoriteMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'genres': genres,
      'summary': summary,
    };
  }
}
