part of "views.dart";

class OrderList extends StatefulWidget {
  // final String concertId;
  // ConcertView({this.concertId});
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  String concertId = 'lSXWI5Cj53gTdvTXcq6B';
  // _ConcertViewState(this.concertId);
  CollectionReference concertCollection;
  CollectionReference ticketCollection;

  @override
  void initState() {
    super.initState();
    concertCollection = FirebaseFirestore.instance.collection("Concerts");
    ticketCollection = FirebaseFirestore.instance
        .collection("Concerts")
        .doc(concertId)
        .collection('Tickets');
  }

  @override
  void dispose() {
    super.dispose();
  }

  int biayaJastip = 50000;
  int totalItem;
  int ongkosJastip;
  int subtotal;
  int grandtotal;
  void detailOrderCalculate() async {
    int _totalItem = await OrderController.getTotalOrderItem();
    int _subtotal = await OrderController.getSubtotalOrderItem();
    setState(() {
      totalItem = _totalItem;
      subtotal = _subtotal;
      grandtotal = _subtotal + (biayaJastip * _totalItem);
      ongkosJastip = biayaJastip * _totalItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    detailOrderCalculate();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Order List')),
      body: Stack(
        children: [
          ListView(padding: EdgeInsets.all(15.0), children: [
            Text(
              'Concert',
              style: TextStyle(
                color: _blackSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            StreamBuilder<DocumentSnapshot>(
                stream: concertCollection.doc(concertId).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  Map<String, dynamic> dataConcert = snapshot.data.data();
                  return Column(children: [
                    Text(
                      dataConcert['title'],
                      style: TextStyle(
                        color: _blackPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    )
                  ]);
                }),
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
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot dataTicket = snapshot.data.docs[index];
                        Ticket ticket = Ticket(
                            dataTicket.id,
                            dataTicket.data()['ticket_type'],
                            dataTicket.data()['price']);
                        return TicketCard(ticket: ticket);
                      });
                }),
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(15.0),
              // color: Colors.red,
              height: 150,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('Total ticket:')),
                      Expanded(
                          child: Text(
                        totalItem.toString(),
                        textAlign: TextAlign.right,
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Ongkos Jastip')),
                      Expanded(
                          child: Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                            .format(ongkosJastip),
                        textAlign: TextAlign.right,
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Subtotal')),
                      Expanded(
                          child: Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                            .format(subtotal),
                        textAlign: TextAlign.right,
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Grandtotal')),
                      Expanded(
                          child: Text(
                        NumberFormat.currency(
                                locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                            .format(grandtotal),
                        textAlign: TextAlign.right,
                      )),
                    ],
                  ),
                  RaisedButton(onPressed: () {}, child: Text('Order!'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
