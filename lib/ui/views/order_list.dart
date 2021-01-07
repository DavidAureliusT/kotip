part of "views.dart";

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    int ticketACount = 0;
    int ticketBCount = 0;
    int ticketCCount = 0;
    const Color _primary = Colors.black;
    const Color _secondary = Colors.black54;
    void _incrementCounter(String ticketID) {
      setState(() {
        if (ticketID == '1') {
          ticketACount++;
        } else if (ticketID == '2') {
          ticketBCount++;
        } else if (ticketID == '3') {
          ticketCCount++;
        }
      });
    }

    void _decreaseCounter(String ticketID) {
      setState(() {
        if (ticketID == '1') {
          ticketACount--;
        } else if (ticketID == '2') {
          ticketBCount--;
        } else if (ticketID == '3') {
          ticketCCount--;
        }
      });
    }

    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Order List'),
              centerTitle: true,
            ),
            SliverPadding(
              padding: EdgeInsets.all(15.0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                Text(
                  'Concert',
                  style: TextStyle(
                    color: _secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'One Heart Jakarta Festival 2020',
                  style: TextStyle(
                    color: _primary,
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
                    color: _primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, bottom: 10.0, right: 15.0, left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Section: General Admission',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(children: [
                          Icon(Icons.help_outline_rounded, color: _secondary),
                          Text(
                            'E-Ticket',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: _secondary,
                            ),
                          ),
                        ]),
                        Row(children: [
                          Expanded(
                            child: Text(
                              'Harga: Rp. 1.250.000 / ticket',
                              style: TextStyle(
                                color: _primary,
                              ),
                            ),
                          ),
                          ticketACount == 0
                              ? FlatButton(
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: _primary,
                                    ),
                                  ),
                                  child: Text(
                                    'Select',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  onPressed: () {
                                    _incrementCounter('1');
                                  },
                                )
                              : Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.blue,
                                      onPressed: () {
                                        _decreaseCounter('1');
                                      },
                                    ),
                                    Text(ticketACount.toString()),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.blue,
                                      onPressed: () {
                                        _incrementCounter('1');
                                      },
                                    ),
                                  ],
                                ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ])),
            ),
          ],
        ),
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
                      '888',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text('Harga Jastip')),
                    Expanded(
                        child: Text(
                      'Rp. 888.888',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text('Subtotal')),
                    Expanded(
                        child: Text(
                      'Rp 888.888',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text('Tax')),
                    Expanded(
                        child: Text(
                      'Rp. 88.888',
                      textAlign: TextAlign.right,
                    )),
                  ],
                ),
                RaisedButton(onPressed: () {}, child: Text('Order!'))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
