// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../providers/cart.dart';
// import '../../providers/order.dart';

// class CartListCard extends StatelessWidget {
//   const CartListCard({Key? key, this.totalAmount}) : super(key: key);

//   final double? totalAmount;

//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);

//     return Card(
//       margin: const EdgeInsets.all(15),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             const Text(
//               'Total',
//               style: TextStyle(fontSize: 20),
//             ),
//             const Spacer(),
//             Chip(
//               label: Text(
//                 '₹${totalAmount!.toStringAsFixed(2)}',
//                 style: TextStyle(
//                   color: Theme.of(context).primaryTextTheme.bodyText1!.color,
//                 ),
//               ),
//               backgroundColor: Theme.of(context).primaryColor,
//             ),
//             TextButton(
//               child: const Text('ORDER NOW'),
//               onPressed: () {
//                 print("Clicked");
//                 Provider.of<Order>(context, listen: false).addOrder(

//                   // cart.cartItem.values.toList(),
//                   totalAmount!,
//                 );
//                 cart.clear();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
