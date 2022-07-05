// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kbti_app/models/definition.dart';
import 'package:kbti_app/screens/themes.dart';
import 'package:kbti_app/widgets/chip_category.dart';

class DefinitionCard extends StatelessWidget {
  final Definition definition;
  const DefinitionCard({Key? key, required this.definition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var convertTime =
        DateTime.fromMillisecondsSinceEpoch(definition.updatedAt * 1000);

    var dateFormatter = DateFormat('dd MMMM yyy');
    String formattedDate = dateFormatter.format(convertTime);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext contect) {
                return AlertDialog(
                  title: Text(definition.term,
                      style: Theme.of(context).textTheme.headline4),
                  content: Text(
                    definition.definition,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              });
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 14,
            right: 14,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    definition.term,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text(
                                'Kategori dari definisi ini adalah ${definition.category}',
                                style: GoogleFonts.lato(fontSize: 12),
                              ),
                            );
                          });
                    },
                    child: ChipCategory(
                      label: definition.category,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              Divider(),
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    definition.username,
                    style: GoogleFonts.lato(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    ' • $formattedDate',
                    style: GoogleFonts.lato(
                        color: Color(0xff6c757d), fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(definition.definition,
                  style: Theme.of(context).textTheme.subtitle1),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Apa itu nilai vote ?',
                                style: GoogleFonts.lato(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              content: Text(
                                'Semakin tinggi nilai vote, maka semakin tinggi tingkat kepercayaannnya.',
                                style: GoogleFonts.lato(fontSize: 12),
                              ),
                            );
                          });
                    },
                    child: ChipCategory(
                        label:
                            'Nilai votes : ${((definition.upVotes) - (definition.downVotes)).toString()}'),
                  ),
                  IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        Clipboard.setData(
                            ClipboardData(text: definition.definition));

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              Timer(Duration(seconds: 1), () {
                                Navigator.pop(context);
                              });
                              return AlertDialog(
                                contentPadding: EdgeInsets.all(8),
                                content: Text(
                                  'Definisi telah disalin',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.copy_rounded,
                        color: isDarkMode ? Colors.white60 : blueColor,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
