import 'package:flutter/material.dart';
import 'package:food_app/widgets/my_theme.dart';

class AppBarWidget extends StatelessWidget {
  final Color? backGroundColor;
  final double? elevation;
  final String? title;
  final Color? iconColors;
  final List<Widget>? action;
  final Color? textColor;
  final Widget? textTextWidget;
  final Widget? iconWidget;
  final Icon? iconArrow;
  final Function()? onTap;
  const AppBarWidget({
    Key? key,
    this.iconWidget,
    this.textTextWidget,
    this.textColor,
    this.action,
    this.iconArrow,
    this.iconColors,
    this.backGroundColor,
    this.elevation,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //   onTap: onTap,
        //   child: iconWidget ??
        //       const Icon(
        //         Icons.arrow_back,
        //         color: Colors.white,
        //       ),
        // ),
        backgroundColor: backGroundColor ?? MyTheme.primaryColor,
        elevation: elevation ?? 0,
        title: textTextWidget ??
            Text(
              title ?? '',
              style: TextStyle(color: textColor ?? MyTheme.whiteColor),
            ),
        actions: action ?? [],
      ),
    );
  }
}