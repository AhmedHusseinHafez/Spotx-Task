class Filters {
  String? orderBy;
  String? orderType;
  int? region;
  int? guest;

  Filters({this.orderBy, this.orderType, this.region, this.guest});

  factory Filters.fromJson(Map<String, dynamic> json) {
    return Filters(
      orderBy: json['order_by'],
      orderType: json['order_type'],
      region: json['region'],
      guest: json['guest'],
    );
  }
}
