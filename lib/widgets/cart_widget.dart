// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'items/cart_list_items.dart';
//
// import '../providers/cart.dart';
// import '../widgets/items/cart_list_card.dart';
//
// class CartWidget extends StatelessWidget {
//   const CartWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final cart = Provider.of<Cart>(context);
//
//     return Column(
//       children: <Widget>[
//         const CartListCard(),
//         const SizedBox(height: 10),
//         Expanded(
//           child: ListView.builder(
//             itemCount: cart.cartItem.length,
//             itemBuilder: (ctx, i) => CartListItems(
//               id: cart.cartItem.values.toList()[i].id,
//               title: cart.cartItem.values.toList()[i].title,
//               price: cart.cartItem.values.toList()[i].price,
//               qauntity: cart.cartItem.values.toList()[i].qauntity,
//               imageUrl: cart.cartItem.values.toList()[i].imageUrl,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
