import 'package:spotx/data/models/region/image_model.dart';

class SubRegion {
  final int? id;
  final String name;
  final String description;
  final List<ImageModel> images;

  SubRegion({
    this.id,
    required this.name,
    required this.description,
    required this.images,
  });

  factory SubRegion.fromJson(Map<String, dynamic> json) {
    return SubRegion(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      images: (json['images'] as List<dynamic>? ?? [])
          .map((image) => ImageModel.fromJson(image))
          .toList(),
    );
  }
}