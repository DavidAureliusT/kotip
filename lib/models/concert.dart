part of 'models.dart';

class Concert extends Equatable {
  //attribute
  final String id;
  final String title;
  final String location;
  final String dueDate;
  final String time;
  final List<Ticket> tickets;

  //constructor

  Concert(this.id, this.title, this.location, this.dueDate, this.time,
      {this.tickets});

  @override
  List<Object> get props => [dueDate, location, title, time, tickets];
}
