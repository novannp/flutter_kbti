import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kbti_app/screens/themes.dart';

class FormInput extends StatelessWidget {
  String? title, hint;
  TextEditingController? controller;
  FormInput({this.title, this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "$title",
        style: Theme.of(context).textTheme.headline4,
      ),
      const SizedBox(
        height: 10,
      ),
      TextField(
        controller: controller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                20,
              ),
              borderSide: BorderSide(
                color: blueColorAccent,
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: '$hint'),
      ),
    ]);
  }
}
