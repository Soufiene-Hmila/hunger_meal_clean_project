class DriverDefaultResponse {

  String? message;

  DriverDefaultResponse({
      this.message,
  });

  factory DriverDefaultResponse.fromJson(dynamic json) {
    return DriverDefaultResponse(
        message: json['message']
    );

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}