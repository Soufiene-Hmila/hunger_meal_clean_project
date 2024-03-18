import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeMode {

  static const containerDropDown = Color(0xFFF1F1F1);

  /// static const primaryColor = Color(0xFF2DB284);
  static const primaryColor = Color(0xFFFC6011);
  static const secondaryColor = Color(0xFF000000);
  static const thirdColor = Color(0xFFFFFFFF);

  static const containerFieldColor = Color(0xFFEFEFEF);
  static const containerNavigator = Color(0xFFFC6011);

  static const iconRestoWhiteColor = Color(0xFFFFFFFF);
  static const iconRestoBlackColor = Color(0xFF000000);
  static const textTitleRedColor = Color(0xFFDA0229);

  static const textColorWhite = Color(0xFFFFFFFF);
  static const textColorGrey = Color(0x66BBBBBB);
  static const textColorBlack = Color(0xFF0C0C0C);

  static const colorBlack = Color(0xFF0C0C0C);
  static const borderColorBlack = Color(0x80000000);
  static const containerColor = Color(0x4D000000);

  static ButtonStyle get elevatedButtonStyle {
    return ElevatedButton.styleFrom(elevation: 1,
        minimumSize: const Size(250, 47.5),
        backgroundColor: const Color(0xFF000000)
    );
  }

  static TextStyle get textFieldStyle {
    return const TextStyle(color: Color(0xFF000000));
  }

  static OutlineInputBorder get outlineInputBorder {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: Color(0xFFA7A9B7), width: 0.5),
    );
  }

  static InputDecoration get inputDecoration {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      hintStyle: const TextStyle(color: Color(0xFFA7A9B7)),
      focusedBorder: AppThemeMode.outlineInputBorder.copyWith(
          borderSide: const BorderSide(color: Color(0xFF191D31), width: 0.75)
      ),
      enabledBorder: AppThemeMode.outlineInputBorder,
      errorBorder: AppThemeMode.outlineInputBorder,
      focusedErrorBorder: AppThemeMode.outlineInputBorder,
      errorStyle: const TextStyle(fontSize: 7.5),
    );
  }

  static get greyOutlineInputBorder {
    return OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Color(0xFFFFFFFF), width: 0.5),
    );
  }

  static ThemeData get light {
    return ThemeData(
      fontFamily: 'FuturaLT', useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xFFFC6011),
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.
          dark.copyWith(statusBarColor: Colors.transparent)
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppThemeMode.textColorBlack),
        bodyMedium: TextStyle(color: AppThemeMode.textColorBlack),
      ),

      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: const IconThemeData(color: Color(0xFFFC6011),),

      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      }),

      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        background: Color(0xFFEEF0F3),
        primary: Color(0xFFFC6011),
        secondary: Color(0xFF00633C),
      ),
    );
  }
}
