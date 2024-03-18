extension OrderState on String {

  String getRestaurantState() {
    switch(this) {
      case 'waiting':
        return 'Accept Order';
      case 'accept':
        return 'Prepare Order';
      case 'inProgress':
        return 'Deliver Order';
      default:
        return 'Reject Order';
    }
  }

  StateRestaurantOrder setRestaurantState() {
    switch(this) {
      case 'waiting':
        return StateRestaurantOrder.accepted;

      case 'accept':
        return StateRestaurantOrder.progress;

      case 'inProgress':
        return StateRestaurantOrder.taken;

      default:
        return StateRestaurantOrder.accepted;
    }
  }

}

enum StateRestaurantOrder {

  accepted('accept'),
  rejected('reject'),
  progress('inProgress'),
  waiting('waiting'),
  taken('taken');

  final String state;

  const StateRestaurantOrder(this.state);

}

class StateOrderParams {

  final StateRestaurantOrder? state;
  final int? id;

  StateOrderParams({
    this.state,
    this.id,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

  
}
