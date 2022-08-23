import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uifirstdesign/ui/styledata/themeColor.dart';

class TStyle {
  final TextStyle welcome =
      GoogleFonts.ubuntu(fontSize: 32, color: Colors.black);
  final TextStyle size16 = GoogleFonts.ubuntu(
    fontSize: 16,
  );
  final TextStyle size16colorgrey = GoogleFonts.ubuntu(
    fontSize: 16,
    color: ThemeColor.textgray1
  );
   

  final TextStyle size12 = GoogleFonts.ubuntu(
    fontSize: 12,
  );
  final TextStyle size36 =
      GoogleFonts.ubuntu(fontSize: 36, color: ThemeColor.primaryblack);
      final TextStyle size18 =
      GoogleFonts.ubuntu(fontSize: 18, color: ThemeColor.primaryblack);
  final TextStyle categorytext =
      GoogleFonts.ubuntu(fontSize: 16, color: ThemeColor.secondaygrey);
}
