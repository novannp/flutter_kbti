import 'package:flutter/material.dart';
import 'package:kbti_app/screens/themes.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String title;
  Function() onPressed;
  CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: Theme.of(context).textTheme.headline5),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
