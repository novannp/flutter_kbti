import 'package:flutter/material.dart';
import 'package:kbti_app/extensions/capitalize_first_letter.dart';
import 'package:kbti_app/providers/theme_provider.dart';
import 'package:kbti_app/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const values = <String>['system', 'light', 'dark'];

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedValue = 'system';
  static const values = <String>['system', 'light', 'dark'];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: buildAppBar('Pengaturan'),
      body: Padding(
        padding: EdgeInsets.only(top: 14, left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tampilan'.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Pilih tema',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        content: Container(
                            width: 300,
                            height: 180,
                            child: buildRadioButton(themeProvider)),
                      );
                    });
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.dark_mode_rounded,
                ),
              ),
              title: Text('Tema'),
              subtitle: Text(selectedValue.capitalize()),
            ),
          ],
        ),
      ),
    );
  }

  setSelectedRadio(String val) {
    setState(() {
      selectedValue = val;
    });
  }

  Widget buildRadioButton(ThemeProvider themeProvider) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RadioListTile(
              title: Text(values[0].capitalize()),
              value: values[0].toString(),
              groupValue: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  themeProvider.changeTheme(newValue);
                });
              }),
          RadioListTile(
              title: Text(values[1].capitalize()),
              value: values[1].toString(),
              groupValue: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  themeProvider.changeTheme(newValue);
                });
              }),
          RadioListTile(
              title: Text(values[2].capitalize()),
              value: values[2].toString(),
              groupValue: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                  themeProvider.changeTheme(newValue);
                });
              })
        ]);
  }
}
