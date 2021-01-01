part of 'views.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final int konserListSize = 10;
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            CustomPaint(
              painter: BluePainter(),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.03,
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.08,
                        ),
                        child: Container(
                          child: SizedBox(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.35,
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Column(
                                children: <Widget>[
                                  BannerText(
                                    bannerTitle: "SF9",
                                    bannerFontFamily:
                                        "BwModelicaSS01 ExtraBold",
                                    bannerFontSize: 28,
                                    bannerFontColor: Colors.white,
                                  ),
                                  BannerText(
                                    bannerTitle: "UNIXVERSE",
                                    bannerFontFamily: "BwModelicaSS01 Hairline",
                                    bannerFontSize: 28,
                                    bannerFontColor: Colors.white,
                                  ),
                                  BannerText(
                                    bannerTitle: "10 AUG 2020",
                                    bannerFontFamily:
                                        "BwModelicaSS01 ExtraBold",
                                    bannerFontSize: 22,
                                    bannerFontColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(33.0),
                            ),
                          ),
                        ),
                      ),
                      Image(
                        image: AssetImage("assets/images/SF9.png"),
                        height: 200,
                        width: 250,
                        alignment: Alignment.bottomLeft,
                      ),
                    ],
                  ),

                  // SizedBox(height: MediaQuery.of(context).size.height / 4),

                  Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(75.0),
                              topRight: Radius.circular(75.0)),
                        ),
                        child: Column(
                          children: <Widget>[
                            new Theme(
                              data: new ThemeData(
                                primaryColor: Colors.black,
                                primaryColorDark: Colors.black,
                              ),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.05),
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: TextField(
                                  //controller: ,
                                  decoration: new InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3DEDA), width: 1.0),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(29),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFE3DEDA), width: 1.0),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(29),
                                      ),
                                    ),
                                    // labelText: "Cari",
                                    hintText:
                                        "Cari Konser, Grup K-Pop atau Jastip Provider ",
                                    hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "BwModelica Regular",
                                        fontSize: 11,
                                        fontWeight: FontWeight.w200),
                                    // labelStyle: TextStyle(color: Colors.black),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.all(
                                    //     Radius.circular(25),
                                    //   ),
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Konser yang Tersedia",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "BwModelica ExtraBold",
                                        color: Color(0xFF59ABFC)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.2),
                                    child: Text(
                                      "Lihat Lainnya >",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "BwModelica ",
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 130,
                              width: 500,
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                // itemCount: snapshot.data.documents.length + 1,
                                itemCount: konserListSize + 1,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index < konserListSize) {
                                    return Card(
                                      //supaya cardnya bisa rounded edge
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Center(
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/Unixverse.jpg"),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Card(
                                      //supaya cardnya bisa rounded edge
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Center(
                                        child: Text("AAAA"),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Konser yang Tersedia",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "BwModelica ExtraBold",
                                        color: Color(0xFF59ABFC)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.2),
                                    child: Text(
                                      "Lihat Lainnya >",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "BwModelica ",
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder:
                                    (BuildContext context, int index) => Card(
                                  child: Center(
                                    child: Text('TestAAAAAAAA'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.02,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Konser yang Tersedia",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "BwModelica ExtraBold",
                                        color: Color(0xFF59ABFC)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.2),
                                    child: Text(
                                      "Lihat Lainnya >",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "BwModelica ",
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Perlu Wrap
                            Wrap(),
                            Card(
                              child: ListTile(
                                  title: Text('Konser 1'),
                                  subtitle:
                                      Text('KONSERRRRRRRRRRRRRRRRRRRRRRRRR')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Konser 2'),
                                  subtitle:
                                      Text('KONSERRRRRRRRRRRRRRRRRRRRRRRRR')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Konser 3'),
                                  subtitle:
                                      Text('KONSERRRRRRRRRRRRRRRRRRRRRRRRR')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Konser 4'),
                                  subtitle:
                                      Text('KONSERRRRRRRRRRRRRRRRRRRRRRRRR')),
                            ),
                            Card(
                              child: ListTile(
                                  title: Text('Konser 5'),
                                  subtitle:
                                      Text('KONSERRRRRRRRRRRRRRRRRRRRRRRRR')),
                            ),
                            //Kasih jarak bottom nav dengan yang di atas
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Bottom Navigation Bar

            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 80,

                // Stack so the paint will be behind the icon
                child: Stack(
                  children: <Widget>[
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: ButtomNavigationPainter(),
                    ),
                    Center(
                      //Raise the center button
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Color(0xFF59ABFC),
                        child: Icon(Icons.shop),
                        elevation: 0.1,
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Banner
class BannerText extends StatelessWidget {
  BannerText({
    @required this.bannerTitle,
    @required this.bannerFontFamily,
    @required this.bannerFontSize,
    @required this.bannerFontColor,
  });

  final String bannerTitle;
  final String bannerFontFamily;
  final double bannerFontSize;
  final Color bannerFontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      bannerTitle,
      style: TextStyle(
          fontFamily: bannerFontFamily,
          fontSize: bannerFontSize,
          color: bannerFontColor),
    );
  }
}

// For painting the app background
class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    //Used for color where the paint will go
    Paint paint = Paint();
    //Used for the path
    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Color(0xFF59ABFC);
    //draw in main background
    canvas.drawPath(mainBackground, paint);

    Path trianglePath = Path();
    //Start paint from 80% of width
    trianglePath.moveTo(width * 0.9, 0);
    trianglePath.lineTo(0, width * 0.60);
    trianglePath.lineTo(0, height);
    trianglePath.lineTo(width, height);
    trianglePath.lineTo(size.width, 0);
    trianglePath.close();
    paint.color = Color(0xFF2C557E);
    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // Not rebuild the paint, only rebuild if change the color
    return oldDelegate != this;
  }
}

// custom buttom navigation painter
class ButtomNavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF2C557E)
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
