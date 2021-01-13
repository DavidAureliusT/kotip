part of 'views.dart';

class DetailConcert extends StatefulWidget {
  final String concertId;
  DetailConcert({this.concertId});
  @override
  _DetailConcertState createState() => new _DetailConcertState(concertId);
}

class _DetailConcertState extends State<DetailConcert> {
  String concertId;
  _DetailConcertState(this.concertId);
  CollectionReference concertCollection;
  CollectionReference ticketCollection;
  List<OrderItem> orderItems;

  @override
  void initState() {
    super.initState();
    concertCollection = FirebaseFirestore.instance.collection("Concerts");
    ticketCollection = FirebaseFirestore.instance
        .collection("Concerts")
        .doc(concertId)
        .collection('Tickets');
    orderItems = List<OrderItem>.empty(growable: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Future<void> _incrementCounter(String ticketId) async {
  //   OrderItem currentItem =
  //       orderItems.singleWhere((item) => item.ticketId == ticketId);
  //   OrderItem newItem =
  //       OrderItem(currentItem.ticketId, currentItem.quantity + 1);
  //   orderItems.removeWhere((item) => item.ticketId == ticketId);
  //   orderItems.add(newItem);
  //   setState(() {});
  // }

  // Future<void> _decreaseCounter(String ticketId) async {
  //   OrderItem currentItem =
  //       orderItems.singleWhere((item) => item.ticketId == ticketId);
  //   OrderItem newItem =
  //       OrderItem(currentItem.ticketId, currentItem.quantity - 1);
  //   orderItems.removeWhere((item) => item.ticketId == ticketId);
  //   orderItems.add(newItem);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            floating: true,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.blue,
            expandedHeight: 200,
            flexibleSpace: StreamBuilder<DocumentSnapshot>(
              stream: concertCollection.doc(concertId).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                Map<String, dynamic> dataConcert = snapshot.data.data();
                return FlexibleSpaceBar(
                    title: Text(
                      dataConcert['title'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(dataConcert['img'], fit: BoxFit.cover),
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
                        )
                      ],
                    ));
              },
            )),
        SliverPadding(
          padding: EdgeInsets.all(15.0),
          sliver: StreamBuilder<DocumentSnapshot>(
            stream: concertCollection.doc(concertId).snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              Map<String, dynamic> dataConcert = snapshot.data.data();
              return SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(height: 15.0),
                ListTile(
                  visualDensity: VisualDensity(vertical: -3),
                  leading: Icon(Icons.pin_drop),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    dataConcert['location'],
                    style: TextStyle(
                      fontSize: 14,
                      color: _blackSecondary,
                    ),
                  ),
                ),
                ListTile(
                  visualDensity: VisualDensity(vertical: -3),
                  leading: Icon(Icons.calendar_today),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    dataConcert['due_date'],
                    style: TextStyle(
                      fontSize: 14,
                      color: _blackSecondary,
                    ),
                  ),
                ),
                ListTile(
                  visualDensity: VisualDensity(vertical: -3),
                  leading: Icon(Icons.access_time),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    dataConcert['time'],
                    style: TextStyle(
                      fontSize: 14,
                      color: _blackSecondary,
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
              ]));
            },
          ),
        ),
        // SliverPadding(
        //   key: UniqueKey(),
        //   padding: EdgeInsets.all(15.0),
        //   sliver: SliverList(
        //     delegate: SliverChildListDelegate([
        //       SizedBox(height: 15.0),
        //       //Jastip Provider
        //       Text(
        //         'Jastip',
        //         style: TextStyle(
        //           color: _blackPrimary,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Container(
        //         padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        //         child: Positioned.fill(
        //           child: Row(
        //             children: [
        //               Image(
        //                 image: AssetImage('assets/images/avataaars.png'),
        //                 height: 65,
        //                 width: 65,
        //               ),
        //               SizedBox(
        //                 width: 10.0,
        //               ),
        //               Expanded(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     SizedBox(
        //                       height: 20.0,
        //                     ),
        //                     Text(
        //                       'Jacob',
        //                       style: TextStyle(
        //                         fontSize: 24,
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       height: 5.0,
        //                     ),
        //                     Row(
        //                       children: [
        //                         Icon(
        //                           Icons.circle,
        //                           color: Colors.green,
        //                           size: 10,
        //                         ),
        //                         Text('Aktif')
        //                       ],
        //                     )
        //                   ],
        //                 ),
        //               ),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.end,
        //                 children: [
        //                   RaisedButton(
        //                     elevation: 3,
        //                     color: Colors.blue,
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(20),
        //                       side: BorderSide(
        //                         color: _blackPrimary,
        //                       ),
        //                     ),
        //                     child: Row(
        //                       children: [
        //                         Text(
        //                           'Contact Jastip',
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 12,
        //                           ),
        //                         ),
        //                         SizedBox(
        //                           width: 10.0,
        //                         ),
        //                         Icon(
        //                           Icons.chat_bubble_rounded,
        //                           color: Colors.white,
        //                           size: 16,
        //                         ),
        //                       ],
        //                     ),
        //                     onPressed: null,
        //                   ),
        //                   SizedBox(
        //                     height: 5.0,
        //                   ),
        //                   Text(
        //                     'Rp. 50.000 / tiket',
        //                     style: TextStyle(fontSize: 14),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       //end of jastip provider
        //     ]),
        //   ),
        // ),
        // SliverPadding(
        //   key: UniqueKey(),
        //   padding: EdgeInsets.all(15.0),
        //   sliver: StreamBuilder(
        //       stream: ticketCollection.snapshots(),
        //       builder: (BuildContext context,
        //           AsyncSnapshot<QuerySnapshot> snapshot) {
        //         if (snapshot.hasError) {
        //           return Text('Something went wrong');
        //         }
        //         return ListView.builder(
        //             shrinkWrap: true,
        //             itemCount: snapshot.data.docs.length,
        //             itemBuilder: (BuildContext context, int index) {
        //               DocumentSnapshot dataTicket = snapshot.data.docs[index];
        //               Ticket ticket = Ticket(
        //                   dataTicket.id,
        //                   dataTicket.data()['ticket_type'],
        //                   dataTicket.data()['price']);
        //               return TicketCard(ticket: ticket);
        //             });
        //       }),
        // ),
        // SizedBox(
        //   height: 10.0,
        // ),
        // FlatButton(
        //   color: Colors.blue,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(20),
        //     side: BorderSide(
        //       color: _blackPrimary,
        //     ),
        //   ),
        //   child: Text(
        //     'JOIN JASTIP',
        //     style: TextStyle(
        //       color: Colors.white,
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.of(context)
        //         .push(MaterialPageRoute(builder: (context) => OrderList()));
        //   },
        // ),
      ],
    ));
  }
}
