import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailConcert extends StatefulWidget {
  final DocumentSnapshot concert;
  DetailConcert({this.concert});

  @override
  DetailConcertState createState() => DetailConcertState();
}

class DetailConcertState extends State<DetailConcert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(widget.concert.data()["name"]),
          subtitle: Text(widget.concert.data()["detail"]),
        ),
      ),
    );
  }
}
