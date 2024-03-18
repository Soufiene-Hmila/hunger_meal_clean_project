class Links {

  dynamic url;
  String? label;
  bool active;

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

}