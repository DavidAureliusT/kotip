part of 'models.dart';

class Jastip extends Equatable {
  //attribute
  final String id;
  final String jastipName;
  final String profilePicture;

  //constructor
  Jastip(this.id, this.jastipName, {this.profilePicture});

  @override
  List<Object> get props => [id, jastipName, profilePicture];
}
