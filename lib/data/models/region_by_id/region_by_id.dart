class RegionByIDModel {
  int? id;
  String? name;
  String? description;
  List<SubRegions>? subRegions;
  List<Images>? images;

  RegionByIDModel(
      {this.id,
      this.name,
      this.description,
      this.subRegions,
      this.images,});

  RegionByIDModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

}

class SubRegions {
  int? id;
  String? name;
  String? description;
  List<Images>? images;

  SubRegions(
      {this.id,
      this.name,
      this.description,
      this.images,});

  SubRegions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }


}

class Images {
  int? id;
  String? image;
  String? url;

  Images({this.id, this.image, this.url});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    url = json['url'];
  }

}
