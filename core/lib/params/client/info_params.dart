class InfoParams {

  final String? username;
  final String? email;
  final int? zoneId;
  final int? id;

  InfoParams({
      this.username, 
      this.email, 
      this.zoneId,
    this.id
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['email'] = email;
    map['zone_id'] = zoneId;
    return map;
  }

}