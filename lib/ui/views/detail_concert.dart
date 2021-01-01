part of 'views.dart';

class DetailConcert extends StatefulWidget {
  @override
  _DetailConcertState createState() => new _DetailConcertState();
}

class _DetailConcertState extends State<DetailConcert> {
  int ticketACount = 0;
  int ticketBCount = 0;
  int ticketCCount = 0;

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

  @override
  Widget build(BuildContext context) {
    const Color _primary = Colors.black;
    const Color _secondary = Colors.black54;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.blue,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'One Heart Jakarta Festival 2020',
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
                    'Stadion Utama Gelora Bung Karno, Jakarta Pusat',
                    style: TextStyle(
                      fontSize: 14,
                      color: _secondary,
                    ),
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.all(0),
                ),
                ListTile(
                  visualDensity: VisualDensity(vertical: -3),
                  leading: Icon(Icons.calendar_today),
                  title: Text(
                    'Sabtu, 16 Oktober 2021',
                    style: TextStyle(
                      fontSize: 14,
                      color: _secondary,
                    ),
                  ),
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.all(0),
                ),
                ListTile(
                  visualDensity: VisualDensity(vertical: -3),
                  leading: Icon(Icons.access_time),
                  title: Text(
                    '15:00 WIB',
                    style: TextStyle(
                      fontSize: 14,
                      color: _secondary,
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
                    color: _primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
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
                                  color: _primary,
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
                          ticketBCount == 0
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
                                    _incrementCounter('2');
                                  },
                                )
                              : Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.blue,
                                      onPressed: () {
                                        _decreaseCounter('2');
                                      },
                                    ),
                                    Text(ticketBCount.toString()),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.blue,
                                      onPressed: () {
                                        _incrementCounter('2');
                                      },
                                    ),
                                  ],
                                ),
                        ]),
                      ],
                    ),
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
                          ticketCCount == 0
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
                                    _incrementCounter('3');
                                  },
                                )
                              : Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Colors.blue,
                                      onPressed: () {
                                        _decreaseCounter('3');
                                      },
                                    ),
                                    Text(ticketCCount.toString()),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.blue,
                                      onPressed: () {
                                        _incrementCounter('3');
                                      },
                                    ),
                                  ],
                                ),
                        ]),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: _primary,
                    ),
                  ),
                  child: Text(
                    'JOIN JASTIP',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => OrderList()));
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
