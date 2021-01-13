part of "controllers.dart";

class OrderController {
  static CollectionReference orderCollection =
      FirebaseFirestore.instance.collection("Orders");
  static CollectionReference orderItemCollection =
      FirebaseFirestore.instance.collection("OrderItems");
  static DocumentReference orderDoc;
  static DocumentReference itemDoc;

  static Future<bool> submitOrder(String buyerId, String jastipId,
      int ongkosJastip, int subtotal, grandtotal) async {
    await Firebase.initializeApp();
    List<OrderItem> _orderItemList = List<OrderItem>.empty(growable: true);
    orderDoc = await orderCollection.add({
      'id': "",
      'buyerId': 'david2021',
      'jastipId': 'veroll2021',
      'ongkosJastip': ongkosJastip,
      'subtotal': subtotal,
      'grandtotal': grandtotal
    });
    await orderItemCollection
        .where('buyerId', isEqualTo: 'david2021')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((data) {
                OrderItem _orderItem = OrderItem(
                    data.id, data['ticketId'], data['quantity'], orderDoc.id);
                _orderItemList.add(_orderItem);
              })
            });

    if (orderDoc.id != null) {
      for (var _orderItem in _orderItemList) {
        orderCollection.doc(orderDoc.id).collection('OrderItems').add({
          'ticketId': _orderItem.ticketId,
          'quantity': _orderItem.quantity,
          'orderId': _orderItem.orderId,
        });
        orderItemCollection.doc(_orderItem.id).delete();
      }
      return true;
    } else {
      return false;
    }
  }

  static Future<int> getTotalItem() async {
    int totalTicket = 0;
    await Firebase.initializeApp();
    await orderItemCollection
        .where('buyerId', isEqualTo: 'david2021')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((data) {
                totalTicket += data['quantity'];
              })
            });
    return totalTicket;
  }

  static Future<int> getSubtotal() async {
    int subtotal = 0;
    await Firebase.initializeApp();
    await orderItemCollection
        .where('buyerId', isEqualTo: 'david2021')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((data) {
                subtotal += data['quantity'] * data['price'];
              })
            });
    return subtotal;
  }

  static Future<int> getItemQuantity(Ticket ticket) async {
    int result;
    String docId;
    await Firebase.initializeApp();
    // User _auth = FirebaseAuth.instance.currentUser;
    try {
      await orderItemCollection
          .where('ticketId', isEqualTo: ticket.id)
          .where('buyerId', isEqualTo: 'david2021')
          .get()
          .then((value) {
        docId = value.docs.first.id;
      });
      await orderItemCollection
          .doc(docId)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        result = documentSnapshot.data()['quantity'];
      });
    } catch (e) {
      result = 0;
    }

    return result;
  }

  static Future<bool> addItem(Ticket ticket) async {
    await Firebase.initializeApp();
    // User _auth = FirebaseAuth.instance.currentUser;
    itemDoc = await orderItemCollection.add({
      'id': "",
      'ticketId': ticket.id,
      'buyerId': 'david2021',
      'price': ticket.price,
      'quantity': 1
    });
    if (itemDoc.id != null) {
      orderItemCollection.doc(itemDoc.id).update({
        'id': itemDoc.id,
      });
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteItem(Ticket ticket) async {
    await Firebase.initializeApp();
    // User _auth = FirebaseAuth.instance.currentUser;
    await orderItemCollection
        .where('ticketId', isEqualTo: ticket.id)
        .where('buyerId', isEqualTo: 'david2021')
        .get()
        .then((value) {
      orderItemCollection.doc(value.docs.first.id).delete();
      itemDoc = orderItemCollection.doc(value.docs.first.id);
    });
    if (itemDoc.id == null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateItem(Ticket ticket, int quantity) async {
    await Firebase.initializeApp();
    bool result = false;
    // User _auth = FirebaseAuth.instance.currentUser;
    try {
      await orderItemCollection
          .where('ticketId', isEqualTo: ticket.id)
          .where('buyerId', isEqualTo: 'david2021')
          .get()
          .then((value) {
        String docId = value.docs.first.id;
        orderItemCollection.doc(docId).update({'quantity': quantity});
        itemDoc = orderItemCollection.doc(value.docs.first.id);
      });
      result = true;
    } catch (e) {
      result = false;
    }
    return result;
  }
}
