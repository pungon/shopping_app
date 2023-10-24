import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shoping/models/modelPd.dart';

Future<List<ProductM>> fetchProduct() async {
  final url = 'http://192.168.1.158:3000/products';
  
  

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);     
      return responseData.map((json) => 
      ProductM(
      product_id: json['product_id'],
      product_name: json['product_name'],
      rate_product: json['rate_product'].toDouble(),
      cost: json['cost'].toDouble(),
      discount: json['discount'],
      SoldQuantity: json['SoldQuantity'],
      transport_price: json['transport_price'].toDouble(),
      Description: json['Description'],
      image_1: json['image_1'],
      store_id: json['store_id']
        )).toList();
    } else {
      throw Exception('Failed to load products');
    }
  } catch (error) {
     throw Exception('Error sending HTTP request: $error');
  }
}