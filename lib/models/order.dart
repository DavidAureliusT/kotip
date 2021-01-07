part of 'models.dart';

class Order extends Equatable {
  final String id;
  final int subtotal;
  final int grandtotal;
  final List<OrderItem> orderItems;

  Order(this.id, this.subtotal, this.grandtotal, {this.orderItems});

  @override
  List<Object> get props => [id, subtotal, grandtotal, orderItems];
}
