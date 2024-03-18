
class StateParams {

  final String? state;
  final int? id;

  StateParams({
      this.state, 
      this.id,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state'] = state;
    return map;
  }

}