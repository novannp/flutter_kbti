import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonMe extends StatelessWidget {
  String? title;
  GestureTapCallback? function;
  ButtonMe({
    Key? key,
    this.title,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: function ?? () {},
      child: Text("$title"),
    );
  }
}
