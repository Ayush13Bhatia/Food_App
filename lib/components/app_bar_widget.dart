import 'package:flutter/material.dart';
import 'package:food_app/utils/my_theme.dart';

class AppBarWidget extends StatelessWidget {
  final Color? backGroundColor;
  final double? elevation;
  final String? title;
  final Function()? onTap;
  final List<Widget>? action;
  final Color? textColor;
  final Widget? iconWidget;
  final IconThemeData? iconThemeData;
  const AppBarWidget({
    Key? key,
    this.iconWidget,
    this.onTap,
    this.textColor,
    this.action,
    this.backGroundColor,
    this.elevation,
    this.title,
    this.iconThemeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor ?? MyTheme.primaryColor,
      elevation: elevation ?? 0,
      iconTheme: iconThemeData,
      title: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: iconWidget,
          ),
          Text(
            title ?? '',
            style: TextStyle(color: textColor ?? MyTheme.whiteColor),
          ),
        ],
      ),
      actions: action ?? [],
    );
  }
}
