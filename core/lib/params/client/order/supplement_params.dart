class SupplementParams {

  final int? id;

  SupplementParams({
      this.id,
  });

  factory SupplementParams.fromJson(dynamic json) {
    return SupplementParams(
        id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

}