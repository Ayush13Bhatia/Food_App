import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/utils/my_theme.dart';

import '../components/text_form_field_widget.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final FocusNode _descriptionFocusNode = FocusNode();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _descriptionUrlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppBar().preferredSize,
        child: AppBarWidget(
          title: 'Edit Screen',
          iconWidget: Container(),
          iconThemeData: const IconThemeData(color: MyTheme.whiteColor),
          backGroundColor: MyTheme.primaryColor,
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormFieldWidget(
                hintText: 'Title',
                title: 'Title',
                controller: _titleController,
                keyBoardType: TextInputType.text,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                hintText: 'Description',
                title: 'Description',
                controller: _descriptionUrlController,
                keyBoardType: TextInputType.multiline,
                maxLines: 2,
                focusNode: _descriptionFocusNode,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                hintText: 'Upload Image',
                title: 'Upload Image',
                controller: _imageUrlController,
                suffixIcon: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.0),
                      ),
                    ),
                    child: const Text(
                      'Upload Image',
                      style: TextStyle(color: MyTheme.whiteColor),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  width: 40 * 3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: MyTheme.primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                        color: MyTheme.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
