
class Data {

  final int id;
  final String intitule;
  final String dernier_maj;
  final String description;
  final int category_id;
  final Object version_id;
  final String created_at;
  final String updated_at;

	Data.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		intitule = map["intitule"],
		dernier_maj = map["dernier_maj"],
		description = map["description"],
		category_id = map["category_id"],
		version_id = map["version_id"],
		created_at = map["created_at"],
		updated_at = map["updated_at"];

}
