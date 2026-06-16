import 'package:ak_sahypa_test/src/ui/src/constants/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme implements ProductTheme{
  @override
  ThemeData get themeData => theme;

  ThemeData get theme => ThemeData(
    scaffoldBackgroundColor: Color(0xff111111),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff111111d6),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white
      ),
    ),
    listTileTheme: ListTileThemeData(
      tileColor: Color(0xff1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      )
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(18, 18))
      )
    ),
    dividerColor: Color(0xffFFFFFF1A),
    bannerTheme: MaterialBannerThemeData(
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
        bodySmall:  TextStyle(
        fontFamily: GoogleFonts.inter.call().fontFamily,
        fontWeight: FontWeight(500),
        color: Color(0xffB8B8B8),
          fontSize: 14,
      ),
      titleMedium: TextStyle(
        fontFamily: GoogleFonts.inter.call().fontFamily,
        fontWeight: FontWeight(700),
        color: Color(0xffFFFFFF),
      ),
      titleSmall: TextStyle(
        fontFamily: GoogleFonts.inter.call().fontFamily,
        fontWeight: FontWeight(600),
        color: Color(0xffE8E8E8),
      ),
      bodyMedium: TextStyle(
        fontFamily: GoogleFonts.inter.call().fontFamily,
        fontWeight: FontWeight(600),
        color: Color(0xffBDA6F5),
        fontSize: 14
      ),
    )
  );

}


