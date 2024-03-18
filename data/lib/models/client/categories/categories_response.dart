import 'package:data/models/client/categories/category_model.dart';
import 'package:data/models/client/categories/links.dart';
import 'package:data/models/restaurant/category/restaurant_category_model.dart';
import 'package:domain/domain.dart';

class CategoriesResponse {

  int? currentPage;
  List<CategoryData>? categories;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  CategoriesResponse({
      this.currentPage, 
      this.categories,
      this.firstPageUrl, 
      this.from, 
      this.lastPage, 
      this.lastPageUrl, 
      this.links, 
      this.nextPageUrl, 
      this.path, 
      this.perPage, 
      this.prevPageUrl, 
      this.to, 
      this.total,
  });

  factory CategoriesResponse.fromJson(dynamic json) {
    return CategoriesResponse(
      currentPage: json['current_page'],
      categories: json['data'] != null ? (json['data'] as List).map((i) =>
          CategoryModel.fromJson(i)).toList() : null,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: json['links'] != null ? (json['links'] as List).map((i) =>
          Links.fromJson(i)).toList() : null,
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );

  }
}