import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String? text;
  final String? hintText;
  final Widget? suffixIcon;
  final double? radius;
  final TextInputType? keyBoardType;
  final int? maxLines;
  final String? title;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  const TextFormFieldWidget(
      {Key? key,
      this.controller,
      this.onFieldSubmitted,
      this.focusNode,
      this.title,
      this.maxLines,
      this.keyBoardType,
      this.text,
      this.hintText,
      this.suffixIcon,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? ''),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: keyBoardType,
          controller: controller,
          maxLines: maxLines ?? 1,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                radius ?? 13,
              ),
            ),
            hintText: hintText ?? '',
            hintStyle: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
          ),
          focusNode: focusNode,
        ),
      ],
    );
  }
}
