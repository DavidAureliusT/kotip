part of 'views.dart';

class ConcertView extends StatefulWidget {
  final String concertId;
  ConcertView({this.concertId});

  @override
  _ConcertViewState createState() => _ConcertViewState(concertId);
}

class _ConcertViewState extends State<ConcertView> {
  String concertId;
  _ConcertViewState(this.concertId);
  CollectionReference concertCollection;
  CollectionReference ticketCollection;
  List<OrderItem> orderItems;
  Concert concert;

  DateTime time = DateTime.now();
  bool _disposed = false;

  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      if (!_disposed)
        setState(() {
          time = time.add(Duration(seconds: -1));
        });
    });
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
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Concert'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: [
          StreamBuilder<DocumentSnapshot>(
              stream: concertCollection.doc(concertId).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                Map<String, dynamic> dataConcert = snapshot.data.data();
                List<Ticket> _tickets = List<Ticket>.empty(growable: true);
                concert = Concert(
                    snapshot.data.id,
                    dataConcert['title'],
                    dataConcert['location'],
                    dataConcert['dueDate'],
                    dataConcert['time'],
                    tickets: _tickets);
                return Column(children: [
                  Container(
                    height: 200,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(dataConcert['img'], fit: BoxFit.cover),
                        Positioned(
                          bottom: 5,
                          left: 5,
                          child: Text(
                            dataConcert['title'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                ]);
              }),
          Text(
            'Jastip',
            style: TextStyle(
              color: _blackPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          jastipTile(),
          StreamBuilder(
              stream: ticketCollection.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot dataTicket = snapshot.data.docs[index];
                      Ticket ticket = Ticket(
                          dataTicket.id,
                          dataTicket.data()['ticket_type'],
                          dataTicket.data()['price']);
                      concert.tickets.add(ticket);
                      return TicketCard(ticket: ticket);
                    });
              }),
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
              'Order Detail',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              // Navigator.of(context)
              //     .restorablePush((context, arguments) => MaterialPageRoute(
              //     builder: (context) => OrderList(concert: concert))
              //         );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderList(concert: concert)));
            },
          ),
        ],
      ),
    );
  }

  Widget jastipTile() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Positioned.fill(
        child: Row(
          children: [
            Image(
              image: AssetImage('assets/images/avataaars.png'),
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
    );
  }
}
