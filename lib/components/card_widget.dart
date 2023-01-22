import 'package:flutter/material.dart';
import 'package:food_app/components/card_type.dart';

class CardWidget extends StatelessWidget {
  final double? elevation;
  final String? image;
  final List<Widget>? typeList;
  final String? title;
  final String? subtitle;
  final bool spacer;
  final Function()? onTap;
  final Function()? iconTap;
  const CardWidget(
      {Key? key, this.spacer = false, this.elevation, this.image, this.title, this.subtitle, this.typeList, this.onTap, this.iconTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: elevation,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 7, top: 7),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: image!.isEmpty
                      ? const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/eat.jpeg'),
                        )
                      : DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(image ?? ''),
                        ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle ?? '',
                  ),
                ],
              ),
            ),
            spacer == true ? const Spacer() : Container(),
            GestureDetector(
              onTap: iconTap,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: CardType(
                  types: typeList ?? [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
