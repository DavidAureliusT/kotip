part of 'widgets.dart';

class TicketCard extends StatefulWidget {
  final Ticket ticket;
  TicketCard({this.ticket});
  @override
  _TicketCardState createState() => _TicketCardState(ticket);
}

class _TicketCardState extends State<TicketCard> {
  Ticket ticket;
  _TicketCardState(this.ticket);
  int ticketQuantity = 0;

  void _incrementCounter() {
    if (mounted)
      setState(() {
        ticketQuantity++;
      });
    if (ticketQuantity == 1) {
      OrderController.addItem(ticket);
    } else {
      OrderController.updateItem(ticket, ticketQuantity);
    }
  }

  void _decreaseCounter() {
    if (mounted)
      setState(() {
        ticketQuantity--;
      });
    if (ticketQuantity == 0) {
      OrderController.deleteItem(ticket);
    } else {
      OrderController.updateItem(ticket, ticketQuantity);
    }
  }

  void setOrderItemCount() async {
    int _quantity = await OrderController.getItemQuantity(ticket);
    if (mounted)
      setState(() {
        ticketQuantity = _quantity;
      });
  }

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
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setOrderItemCount();
    return Card(
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
              ticket.ticketType,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(children: [
              Icon(Icons.help_outline_rounded, color: _blackSecondary),
              Text(
                'E-Ticket',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: _blackSecondary,
                ),
              ),
            ]),
            Row(children: [
              Expanded(
                child: Text(
                  NumberFormat.currency(
                    locale: 'id',
                    decimalDigits: 0,
                    symbol: 'Rp ',
                  ).format(ticket.price),
                  style: TextStyle(
                    color: _blackPrimary,
                  ),
                ),
              ),
              ticketQuantity == 0
                  ? FlatButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: _blackPrimary,
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
                        _incrementCounter();
                      },
                    )
                  : Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          color: Colors.blue,
                          onPressed: () {
                            _decreaseCounter();
                          },
                        ),
                        Text(ticketQuantity.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          color: Colors.blue,
                          onPressed: () {
                            _incrementCounter();
                          },
                        ),
                      ],
                    ),
            ]),
          ],
        ),
      ),
    );
  }
}
