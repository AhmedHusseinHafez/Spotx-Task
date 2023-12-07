import 'package:spotx/data/models/units/images.dart';


class UnitsModel {
  int? id;
  String? title;
  int? currentPrice;
  String? description;
  List<Images>? images;
  String? regionName;
  int? regionId;

  UnitsModel({
    this.id,
    this.currentPrice,
    this.title,
    this.description,
    this.regionId,
    this.images,
    this.regionName,
  });

  UnitsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    currentPrice = json['current_price'];
    title = json['title'];
    description = json['description'];

    regionId = json['region_id'];

    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }

    regionName = json['region_name'];
  }
}
