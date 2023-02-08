import 'cart_item_model.dart';

class OrderItem {
  final String? id;
  final String? title;
  final double? amount;
  final String? imageUrl;
  final List<CartItem>? products;
  final DateTime? dateTime;

  OrderItem({
    this.id,
    this.title,
    this.amount,
    this.imageUrl,
    this.products,
    this.dateTime,
  });
}
