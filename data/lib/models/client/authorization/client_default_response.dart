class ClientDefaultResponse {

  String? message;

  ClientDefaultResponse({
      this.message,
  });

  factory ClientDefaultResponse.fromJson(dynamic json) {
    return ClientDefaultResponse(
        message: json['message']
    );

  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}