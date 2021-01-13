part of "views.dart";

class OrderList extends StatefulWidget {
  final Concert concert;
  OrderList({this.concert});
  @override
  _OrderListState createState() => _OrderListState(concert);
}

class _OrderListState extends State<OrderList> {
  String concertId = 'lSXWI5Cj53gTdvTXcq6B';
  Concert concert;
  _OrderListState(this.concert);
  CollectionReference concertCollection;
  CollectionReference ticketCollection;
  CollectionReference orderItemCollection;

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
    orderItemCollection = FirebaseFirestore.instance.collection('OrderItems');
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  int biayaJastip = 50000;
  int totalItem;
  int ongkosJastip;
  int subtotal;
  int grandtotal;

  void detailOrderCalculate() async {
    int _totalItem = await OrderController.getTotalItem();
    int _subtotal = await OrderController.getSubtotal();
    if (mounted)
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
            Text(
              concert.title,
              style: TextStyle(
                color: _blackPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Tickets',
              style: TextStyle(
                color: _blackPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            StreamBuilder(
                stream: orderItemCollection.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot dataItem = snapshot.data.docs[index];
                        Ticket ticket = concert.tickets.firstWhere(
                            (element) => element.id == dataItem['ticketId']);
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
                    onPressed: () async {
                      bool _submitStatus = await OrderController.submitOrder(
                          'david2021',
                          'veroll2021',
                          ongkosJastip,
                          subtotal,
                          grandtotal);
                      if (_submitStatus == true) {
                        Fluttertoast.showToast(
                          msg: "Submit Success!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Home()));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Submit failed. Please try again.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
