part of "controllers.dart";

class OrderController {
  static CollectionReference orderCollection =
      FirebaseFirestore.instance.collection("Orders");
  static DocumentReference orderDoc;

  static Future<bool> submitOrder(String buyerId, String jastipId,
      int ongkosJastip, int subtotal, grandtotal) async {
    await Firebase.initializeApp();
    List<OrderItem> _orderItemList;
    orderDoc = await orderCollection.add({
      'id': "",
      'buyerId': 'david2021',
      'jastipId': 'veroll2021',
      'ongkosJastip': ongkosJastip,
      'subtotal': subtotal,
      'grandtotal': grandtotal
    });
    await orderCollection
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
      orderCollection.doc(orderDoc.id).update({
        'id': orderDoc.id,
      });
      return true;
    } else {
      return false;
    }
  }

  static Future<int> getTotalOrderItem() async {
    int totalTicket = 0;
    await Firebase.initializeApp();
    await orderCollection
        .where('buyerId', isEqualTo: 'david2021')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((data) {
                totalTicket += data['quantity'];
              })
            });
    return totalTicket;
  }

  static Future<int> getSubtotalOrderItem() async {
    int subtotal = 0;
    await Firebase.initializeApp();
    await orderCollection
        .where('buyerId', isEqualTo: 'david2021')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((data) {
                subtotal += data['quantity'] * data['price'];
              })
            });
    return subtotal;
  }

  static Future<int> getOrderItemCount(Ticket ticket) async {
    int result;
    String docId;
    await Firebase.initializeApp();
    // User _auth = FirebaseAuth.instance.currentUser;
    await orderCollection
        .where('ticketId', isEqualTo: ticket.id)
        .where('buyerId', isEqualTo: 'david2021')
        .get()
        .then((value) {
      docId = value.docs.first.id;
    });
    await orderCollection
        .doc(docId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      result = documentSnapshot.data()['quantity'];
    });
    return result;
  }

  static Future<bool> addOrderItem(Ticket ticket) async {
    await Firebase.initializeApp();
    // User _auth = FirebaseAuth.instance.currentUser;
    orderDoc = await orderCollection.add({
      'id': "",
      'ticketId': ticket.id,
      'buyerId': 'david2021',
      'price': ticket.price,
      'quantity': 1
    });
    if (orderDoc.id != null) {
      orderCollection.doc(orderDoc.id).update({
        'id': orderDoc.id,
      });
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteOrderItem(Ticket ticket) async {
    await Firebase.initializeApp();
    // User _auth = FirebaseAuth.instance.currentUser;
    await orderCollection
        .where('ticketId', isEqualTo: ticket.id)
        .where('buyerId', isEqualTo: 'david2021')
        .get()
        .then((value) {
      orderCollection.doc(value.docs.first.id).delete();
      orderDoc = orderCollection.doc(value.docs.first.id);
    });
    if (orderDoc.id == null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updateOrderItem(Ticket ticket, int quantity) async {
    await Firebase.initializeApp();
    bool result = false;
    // User _auth = FirebaseAuth.instance.currentUser;
    try {
      await orderCollection
          .where('ticketId', isEqualTo: ticket.id)
          .where('buyerId', isEqualTo: 'david2021')
          .get()
          .then((value) {
        String docId = value.docs.first.id;
        orderCollection.doc(docId).update({'quantity': quantity});
        orderDoc = orderCollection.doc(value.docs.first.id);
      });
      result = true;
    } catch (e) {
      result = false;
    }
    return result;
  }
}
