// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  definition.term,
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: blueColor,
                  ),
                ),
                Spacer(),
                ChipCategory(
                  label: definition.category,
                ),
                SizedBox(width: 10),
                ChipCategory(
                    label:
                        'Nilai votes : ${((definition.upVotes) - (definition.downVotes)).toString()}'),
              ],
            ),
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
                  style:
                      GoogleFonts.lato(color: Color(0xff6c757d), fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              definition.definition,
              style: GoogleFonts.lato(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
