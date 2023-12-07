class Images {
  int? id;
  String? type;
  String? url;
  int? isDefault;

  Images({this.id, this.type, this.url, this.isDefault});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    url = json['url'];
    isDefault = json['is_default'];
  }

}
