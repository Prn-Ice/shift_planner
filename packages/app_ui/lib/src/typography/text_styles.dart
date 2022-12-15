import 'package:app_ui/src/colors.dart';
import 'package:app_ui/src/typography/typography.dart';
import 'package:flutter/widgets.dart';

/// ShiftPlanner Text Style Definitions
class ShiftPlannerTextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontFamily: 'OpenSans',
    color: ShiftPlannerColors.black,
    fontWeight: ShiftPlannerFontWeight.regular,
  );

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 56,
      fontWeight: ShiftPlannerFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 30,
      fontWeight: ShiftPlannerFontWeight.regular,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 28,
      fontWeight: ShiftPlannerFontWeight.regular,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: ShiftPlannerFontWeight.bold,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 20,
      fontWeight: ShiftPlannerFontWeight.medium,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _baseTextStyle.copyWith(
      fontSize: 22,
      fontWeight: ShiftPlannerFontWeight.bold,
    );
  }

  /// Subtitle 1 Text Style
  static TextStyle get subtitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: ShiftPlannerFontWeight.bold,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get subtitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: ShiftPlannerFontWeight.bold,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyText1 {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: ShiftPlannerFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText2 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: ShiftPlannerFontWeight.regular,
    );
  }

  /// Caption Text Style
  static TextStyle get caption {
    return _baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: ShiftPlannerFontWeight.regular,
    );
  }

  /// Overline Text Style
  static TextStyle get overline {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: ShiftPlannerFontWeight.regular,
    );
  }

  /// Button Text Style
  static TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 18,
      fontWeight: ShiftPlannerFontWeight.medium,
    );
  }
}
