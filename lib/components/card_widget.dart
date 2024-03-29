import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/image_asset.dart';
import 'package:food_app/utils/my_theme.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key? key, this.spacer = false, this.elevation, this.image, this.title, this.subtitle, this.typeList, this.onTap, this.iconTap})
      : super(key: key);
  final double? elevation;
  final String? image;
  final List<Widget>? typeList;
  final String? title;
  final String? subtitle;
  final bool spacer;
  final Function()? onTap;
  final Function()? iconTap;

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
              child: SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundColor: MyTheme.whiteColor,
                  radius: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      imageUrl: image ?? '',
                      progressIndicatorBuilder: (context, url, d) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: d.totalSize != null && d.progress != null ? d.progress! / d.totalSize! : null,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) => const Image(
                        image: AssetImage(Assets.assetsImageEat),
                      ),
                    ),
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
                child: Row(
                  children: typeList ?? [],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
