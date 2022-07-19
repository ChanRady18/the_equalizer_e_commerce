import 'package:app_01/model/order.dart';
import 'package:flutter/cupertino.dart';


class OrderNotify extends ChangeNotifier {
  List<Order> items = [];

  
  double get total {
    return items.fold(0.0, (double currentTotal, Order nextProduct){
      return currentTotal + nextProduct.price;
    });
  }

 

  void addOrder(Order order) {
    // check list product in item
    final i = items.indexWhere((e) => e.product == order.product);
    if (i > -1) {
      items[i].qty += order.qty;
    } else {
      this.items.add(order);
    }
    notifyListeners();
  }

  removeOrder(o) {
    items.remove(o);
    notifyListeners();
  }

  decrementQty(order) {
    final i = items.indexWhere((e) => e.product == order.product);
    if (items[i].qty == 1) {
      removeOrder(order);
    } else {
      items[i].qty -= 1;
      notifyListeners();
    }
  }

  incrementQty(order) {
    items[items.indexOf(order)].qty += 1;
    notifyListeners();
  }

  
  
}
