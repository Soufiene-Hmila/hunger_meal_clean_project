
import 'package:data/models/client/restaurant/links.dart';
import 'package:data/models/client/restaurant/restaurant_model.dart';
import 'package:domain/domain.dart';

class ResponseData {

  final int? currentPage;
  final List<RestaurantData>? restaurants;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Links>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  ResponseData({
      this.currentPage, 
      this.restaurants, 
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

  factory ResponseData.fromJson(dynamic json) {
    return ResponseData(
      currentPage: json['current_page'],
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
      restaurants: json['data'] != null ? (json['data'] as List).map((i) =>
          RestaurantModel.fromJson(i)).toList() : null,
      links: json['links'] != null ? (json['links'] as List).map((i) =>
          Links.fromJson(i)).toList() : null,

    );
  }

}