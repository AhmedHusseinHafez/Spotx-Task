import 'package:spotx/data/models/region/image_model.dart';
import 'package:spotx/data/models/region/sub_region.dart';

class RegionModel {
  int? id;
  final String name;
  final String description;
  final List<SubRegion> subRegions;
  final List<ImageModel> images;

  RegionModel({
    this.id,
    required this.name,
    required this.description,
    required this.subRegions,
    required this.images,
  });

  factory RegionModel.fromJson(Map<String, dynamic> json) {
    return RegionModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      subRegions: (json['sub_regions'] as List<dynamic>? ?? [])
          .map((subRegion) => SubRegion.fromJson(subRegion))
          .toList(),
      images: (json['images'] as List<dynamic>? ?? [])
          .map((image) => ImageModel.fromJson(image))
          .toList(),
    );
  }
}




