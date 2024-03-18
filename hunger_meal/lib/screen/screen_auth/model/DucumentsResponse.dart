import 'package:hunger_meal/screen/screen_auth/model/data.dart';
import 'package:hunger_meal/screen/screen_auth/model/links.dart';

class DucumentsResponse {

  final int current_page;
  final List<Data> data;
  final String first_page_url;
  final int from;
  final int last_page;
  final String last_page_url;
  final List<Links> links;
  final Object next_page_url;
  final String path;
  final int per_page;
  final Object prev_page_url;
  final int to;
  final int total;

	DucumentsResponse.fromJsonMap(Map<String, dynamic> map): 
		current_page = map["current_page"],
		data = List<Data>.from(map["data"].map((it) => Data.fromJsonMap(it))),
		first_page_url = map["first_page_url"],
		from = map["from"],
		last_page = map["last_page"],
		last_page_url = map["last_page_url"],
		links = List<Links>.from(map["links"].map((it) => Links.fromJsonMap(it))),
		next_page_url = map["next_page_url"],
		path = map["path"],
		per_page = map["per_page"],
		prev_page_url = map["prev_page_url"],
		to = map["to"],
		total = map["total"];

}
