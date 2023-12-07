class ImageModel {
  final int? id;
  final String image;
  final String url;

  ImageModel({
    this.id,
    required this.image,
    required this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      url: json['url'] ?? '',
    );
  }
}