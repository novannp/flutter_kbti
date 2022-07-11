import 'package:flutter/material.dart';
import 'package:kbti_app/screens/themes.dart';

// ignore: must_be_immutable
class FormInput extends StatelessWidget {
  String title;
  String hint;
  TextEditingController? controller;
  FormInput(
      {Key? key, required this.title, required this.hint, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
      const SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
              borderSide: BorderSide(
                color: blueColor,
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: hint),
      ),
    ]);
  }
}
