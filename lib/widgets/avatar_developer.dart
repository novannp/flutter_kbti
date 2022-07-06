import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/themes.dart';

class AvatarDeveloper extends StatelessWidget {
  final String name;
  final String networkImage;
  final String collage;
  const AvatarDeveloper(
      {Key? key,
      required this.name,
      required this.networkImage,
      required this.collage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: CircleAvatar(
            backgroundImage: NetworkImage(networkImage),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 140,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 130, child: Divider()),
        Text(
          collage,
          style: GoogleFonts.lato(fontSize: 14),
        ),
      ],
    );
  }
}
