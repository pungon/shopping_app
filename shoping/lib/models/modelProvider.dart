import 'package:flutter/foundation.dart';

class MyModel extends ChangeNotifier {
  String data = "Initial data";

  void updateData(String newData) {
    data = newData;
    notifyListeners(); // แจ้งเตือนวิวที่ใช้งานข้อมูลว่ามีการเปลี่ยนแปลง
  }
}

class ProductMId {
  final int product_id;
ProductMId({
  required this.product_id
});
}

class Shopping_cart extends ChangeNotifier {
  List<ProductMId> data = [];

  void updateData(ProductMId newData) {
     data.add(newData);
    notifyListeners(); // แจ้งเตือนวิวที่ใช้งานข้อมูลว่ามีการเปลี่ยนแปลง
  }
}
