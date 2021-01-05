part of 'views.dart';

class DetailConcert extends StatefulWidget {
  @override
  _DetailConcertState createState() => new _DetailConcertState();
}

class _DetailConcertState extends State<DetailConcert> {
  String idConcert = "lSXWI5Cj53gTdvTXcq6B";

  CollectionReference concertCollection =
      FirebaseFirestore.instance.collection("Concerts");
  CollectionReference ticketCollection = FirebaseFirestore.instance
      .collection("Concerts")
      .doc("lSXWI5Cj53gTdvTXcq6B")
      .collection('Tickets');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: concertCollection.doc(idConcert).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data.data();
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  stretch: true,
                  backgroundColor: Colors.blue,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      data['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground
                    ],
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          'https://i.pinimg.com/originals/96/b6/3e/96b63e1d6332f8c70bf51c033e101152.jpg',
                          fit: BoxFit.cover,
                        ),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.0, 0.5),
                              end: Alignment(0.0, 0.0),
                              colors: <Color>[
                                Color(0x60000000),
                                Color(0x00000000),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(15.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                      //Concert Title
                      SizedBox(
                        height: 15.0,
                      ),
                      //Concert Info
                      ListTile(
                        visualDensity: VisualDensity(vertical: -3),
                        leading: Icon(Icons.pin_drop),
                        title: Text(
                          data['location'],
                          style: TextStyle(
                            fontSize: 14,
                            color: _blackSecondary,
                          ),
                        ),
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -3),
                        leading: Icon(Icons.calendar_today),
                        title: Text(
                          data['due_date'],
                          style: TextStyle(
                            fontSize: 14,
                            color: _blackSecondary,
                          ),
                        ),
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      ListTile(
                        visualDensity: VisualDensity(vertical: -3),
                        leading: Icon(Icons.access_time),
                        title: Text(
                          data['time'],
                          style: TextStyle(
                            fontSize: 14,
                            color: _blackSecondary,
                          ),
                        ),
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.all(0),
                      ),
                      //End of concert info
                      SizedBox(
                        height: 15.0,
                      ),
                      //Jastip Provider
                      Text(
                        'Jastip',
                        style: TextStyle(
                          color: _blackPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Positioned.fill(
                          child: Row(
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/images/avataaars.png'),
                                height: 65,
                                width: 65,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'Jacob',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 10,
                                        ),
                                        Text('Aktif')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RaisedButton(
                                    elevation: 3,
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: _blackPrimary,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Contact Jastip',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Icon(
                                          Icons.chat_bubble_rounded,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                    onPressed: null,
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    'Rp. 50.000 / tiket',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      //end of jastip provider
                      SizedBox(
                        height: 15.0,
                      ),
                      //Tickets
                      Text(
                        'Tickets',
                        style: TextStyle(
                          color: _blackPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      StreamBuilder(
                        stream: ticketCollection.snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Text("There is a ticket");
                          }
                          return new ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot dataTicket =
                                  snapshot.data.docs[index];
                              Ticket ticket = Ticket(
                                  dataTicket.id,
                                  dataTicket.data()['ticket_type'],
                                  dataTicket.data()['price']);
                              return TicketCard(ticket: ticket);
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FlatButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: _blackPrimary,
                          ),
                        ),
                        child: Text(
                          'JOIN JASTIP',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OrderList()));
                        },
                      ),
                    ]),
                  ),
                ),
              ],
            );
            // return Text('Success!');
          }
          return Text('loading');
        },
      ),
    );
  }
}
