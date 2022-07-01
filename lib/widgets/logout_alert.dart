import 'package:flutter/material.dart';

class LogoutAlert extends StatelessWidget {
  const LogoutAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showAlertDialog(context);
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text("Logout"),
      content: const Text("Mohon maaf fitur ini belum dapat digunakan."),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok')),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
