part of 'models.dart';

class Ticket extends Equatable {
  //attribute
  final String id;
  final String ticketType;
  final int price;

  //constructor
  Ticket(this.id, this.ticketType, this.price);

  @override
  List<Object> get props => [id, ticketType, price];
}
