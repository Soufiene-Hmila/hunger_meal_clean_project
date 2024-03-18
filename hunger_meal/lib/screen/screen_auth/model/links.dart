
class Links {

  final Object url;
  final String label;
  final bool active;

	Links.fromJsonMap(Map<String, dynamic> map): 
		url = map["url"],
		label = map["label"],
		active = map["active"];

}
