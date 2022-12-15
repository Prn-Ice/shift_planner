import 'package:app_ui/src/colors.dart';
import 'package:app_ui/src/typography/typography.dart';
import 'package:flutter/material.dart';

const _smallTextScaleFactor = 0.80;
const _largeTextScaleFactor = 1.20;

/// Namespace for the ShiftPlanner [ThemeData].
class ShiftPlannerTheme {
  /// Standard `ThemeData` for ShiftPlanner UI.
  static ThemeData get standard {
    return ThemeData(
      colorScheme:
          ColorScheme.fromSwatch(accentColor: ShiftPlannerColors.primary),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      textTheme: _textTheme,
      dialogBackgroundColor: ShiftPlannerColors.whiteBackground,
      dialogTheme: _dialogTheme,
      tooltipTheme: _tooltipTheme,
      bottomSheetTheme: _bottomSheetTheme,
      tabBarTheme: _tabBarTheme,
      dividerTheme: _dividerTheme,
    );
  }

  /// `ThemeData` for ShiftPlanner UI for small screens.
  static ThemeData get small {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for ShiftPlanner UI for medium screens.
  static ThemeData get medium {
    return standard.copyWith(textTheme: _smallTextTheme);
  }

  /// `ThemeData` for ShiftPlanner UI for large screens.
  static ThemeData get large {
    return standard.copyWith(textTheme: _largeTextTheme);
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

  static TextTheme get _smallTextTheme {
    return TextTheme(
      headline1: ShiftPlannerTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _smallTextScaleFactor,
      ),
      headline2: ShiftPlannerTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _smallTextScaleFactor,
      ),
      headline3: ShiftPlannerTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _smallTextScaleFactor,
      ),
      headline4: ShiftPlannerTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _smallTextScaleFactor,
      ),
      headline5: ShiftPlannerTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _smallTextScaleFactor,
      ),
      headline6: ShiftPlannerTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle1: ShiftPlannerTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _smallTextScaleFactor,
      ),
      subtitle2: ShiftPlannerTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText1: ShiftPlannerTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _smallTextScaleFactor,
      ),
      bodyText2: ShiftPlannerTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _smallTextScaleFactor,
      ),
      caption: ShiftPlannerTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _smallTextScaleFactor,
      ),
      overline: ShiftPlannerTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _smallTextScaleFactor,
      ),
      button: ShiftPlannerTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _smallTextScaleFactor,
      ),
    );
  }

  static TextTheme get _largeTextTheme {
    return TextTheme(
      headline1: ShiftPlannerTextStyle.headline1.copyWith(
        fontSize: _textTheme.headline1!.fontSize! * _largeTextScaleFactor,
      ),
      headline2: ShiftPlannerTextStyle.headline2.copyWith(
        fontSize: _textTheme.headline2!.fontSize! * _largeTextScaleFactor,
      ),
      headline3: ShiftPlannerTextStyle.headline3.copyWith(
        fontSize: _textTheme.headline3!.fontSize! * _largeTextScaleFactor,
      ),
      headline4: ShiftPlannerTextStyle.headline4.copyWith(
        fontSize: _textTheme.headline4!.fontSize! * _largeTextScaleFactor,
      ),
      headline5: ShiftPlannerTextStyle.headline5.copyWith(
        fontSize: _textTheme.headline5!.fontSize! * _largeTextScaleFactor,
      ),
      headline6: ShiftPlannerTextStyle.headline6.copyWith(
        fontSize: _textTheme.headline6!.fontSize! * _largeTextScaleFactor,
      ),
      subtitle1: ShiftPlannerTextStyle.subtitle1.copyWith(
        fontSize: _textTheme.subtitle1!.fontSize! * _largeTextScaleFactor,
      ),
      subtitle2: ShiftPlannerTextStyle.subtitle2.copyWith(
        fontSize: _textTheme.subtitle2!.fontSize! * _largeTextScaleFactor,
      ),
      bodyText1: ShiftPlannerTextStyle.bodyText1.copyWith(
        fontSize: _textTheme.bodyText1!.fontSize! * _largeTextScaleFactor,
      ),
      bodyText2: ShiftPlannerTextStyle.bodyText2.copyWith(
        fontSize: _textTheme.bodyText2!.fontSize! * _largeTextScaleFactor,
      ),
      caption: ShiftPlannerTextStyle.caption.copyWith(
        fontSize: _textTheme.caption!.fontSize! * _largeTextScaleFactor,
      ),
      overline: ShiftPlannerTextStyle.overline.copyWith(
        fontSize: _textTheme.overline!.fontSize! * _largeTextScaleFactor,
      ),
      button: ShiftPlannerTextStyle.button.copyWith(
        fontSize: _textTheme.button!.fontSize! * _largeTextScaleFactor,
      ),
    );
  }

  static AppBarTheme get _appBarTheme {
    return const AppBarTheme(color: ShiftPlannerColors.primary);
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0, backgroundColor: ShiftPlannerColors.primary,
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
        foregroundColor: ShiftPlannerColors.white, shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        side: const BorderSide(color: ShiftPlannerColors.white, width: 2),
        fixedSize: const Size(208, 54),
      ),
    );
  }

  static TooltipThemeData get _tooltipTheme {
    return const TooltipThemeData(
      decoration: BoxDecoration(
        color: ShiftPlannerColors.charcoal,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      padding: EdgeInsets.all(10),
      textStyle: TextStyle(color: ShiftPlannerColors.white),
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
      backgroundColor: ShiftPlannerColors.whiteBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  static TabBarTheme get _tabBarTheme {
    return const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: ShiftPlannerColors.primary,
        ),
      ),
      labelColor: ShiftPlannerColors.primary,
      unselectedLabelColor: ShiftPlannerColors.black25,
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  static DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      space: 0,
      thickness: 1,
      color: ShiftPlannerColors.black25,
    );
  }
}
