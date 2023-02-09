import 'package:flutter/material.dart';
import 'package:food_app/components/app_bar_widget.dart';
import 'package:food_app/utils/my_theme.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Description"),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
              ),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Image Url',
                      suffixIcon: Container(
                        width: 100,
                        height: 100,
                        color: MyTheme.primaryColor,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyTheme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            'Upload Image',
                            style: TextStyle(color: MyTheme.whiteColor),
                          ),
                          onPressed: () {},
                        ),
                      )),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  controller: _imageUrlController),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 40,
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
                        "Save",
                        style: TextStyle(
                          color: MyTheme.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
