// ignore: file_names
class ProductM {
  final int product_id;
  final String product_name;
  final double rate_product;
  final double cost;
  final int? discount;
  final int SoldQuantity;
  final double transport_price;
  final String Description;
  final String? image_1;
  final int store_id;

ProductM(
      {
      required this.product_id,
      required this.product_name,
      required this.rate_product,
      required this.cost,
      required this.discount,
      required this.SoldQuantity,
      required this.transport_price,
      required this.Description,
      required this.image_1,
      required this.store_id
      });

  factory ProductM.fromJson(Map<String, dynamic> json) {
    return ProductM(
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
    );
  }
}
class test {
  final int product_id;
  final String product_name;

test(
  {
    required this.product_id,
    required this.product_name

  }
);
}