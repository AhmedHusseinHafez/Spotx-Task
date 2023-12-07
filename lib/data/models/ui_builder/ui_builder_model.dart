import 'package:spotx/data/models/ui_builder/filters.dart';

class UiBuilderModel {
  String? title;
  String? description;
  String? content;
  Filters? filters;

  UiBuilderModel({this.title, this.description, this.content, this.filters});

  factory UiBuilderModel.fromJson(Map<String, dynamic> json) {
    return UiBuilderModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      filters:
          json['filters'] != null ? Filters.fromJson(json['filters']) : null,
    );
  }
}
