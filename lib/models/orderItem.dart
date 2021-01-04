part of 'models.dart';

class OrderItem extends Equatable {
  final String id;
  final String ticketId;
  final int quantity;
  final String orderId;

  OrderItem(this.id, this.ticketId, this.quantity, this.orderId);
  @override
  List<Object> get props => [id, ticketId, quantity, orderId];
}
