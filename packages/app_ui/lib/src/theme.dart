import 'package:app_ui/src/typography/typography.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Namespace for the ShiftPlanner [ThemeData].
class ShiftPlannerTheme {
  /// Standard `ThemeData` for ShiftPlanner UI.
  static ThemeData theme({bool isDark = false}) {
    final base = isDark
        ? FlexThemeData.dark(scheme: FlexScheme.mandyRed)
        : FlexThemeData.light(scheme: FlexScheme.mandyRed);

    return base.copyWith(
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme.apply(
        bodyColor: isDark ? Colors.white : Colors.black,
      ),
      dialogTheme: _dialogTheme,
      bottomSheetTheme: _bottomSheetTheme,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      headline1: ShiftPlannerTextStyle.headline1,
      headline2: ShiftPlannerTextStyle.headline2,
      headline3: ShiftPlannerTextStyle.headline3,
      headline4: ShiftPlannerTextStyle.headline4,
      headline5: ShiftPlannerTextStyle.headline5,
      headline6: ShiftPlannerTextStyle.headline6,
      subtitle1: ShiftPlannerTextStyle.subtitle1,
      subtitle2: ShiftPlannerTextStyle.subtitle2,
      bodyText1: ShiftPlannerTextStyle.bodyText1,
      bodyText2: ShiftPlannerTextStyle.bodyText2,
      caption: ShiftPlannerTextStyle.caption,
      overline: ShiftPlannerTextStyle.overline,
      button: ShiftPlannerTextStyle.button,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static OutlinedButtonThemeData get _outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static DialogTheme get _dialogTheme {
    return DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }
}
