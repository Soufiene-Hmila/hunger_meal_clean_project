class Links {

  final dynamic url;
  final String? label;
  final bool active;

  Links({
      this.url, 
      this.label, 
      this.active = false,
  });

  factory Links.fromJson(dynamic json) {
    return Links(
        url: json['url'],
        label: json['label'],
        active: json['active'],
    );

  }
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['url'] = url;
  //   map['label'] = label;
  //   map['active'] = active;
  //   return map;
  // }

}