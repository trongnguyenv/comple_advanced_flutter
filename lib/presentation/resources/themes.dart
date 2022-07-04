import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';
import 'sizes.dart';
import 'styles.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primaryOpacity70,
    primaryColorDark: AppColors.darkPrimary,
    disabledColor: AppColors.grey1,

    // ripple color
    splashColor: AppColors.primaryOpacity70,

    // will be used incase of disabled button
    accentColor: AppColors.grey,

    // card view theme
    cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.grey,
        elevation: AppSize.s4),

    // App bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primary,
        elevation: AppSize.s4,
        shadowColor: AppColors.primaryOpacity70,
        titleTextStyle: getRegularStyle(
          color: AppColors.white,
          fontSize: FontSize.s16,
        )),

    // Button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: AppColors.grey1,
      buttonColor: AppColors.primary,
      splashColor: AppColors.primaryOpacity70,
    ),

    // elevanted button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(color: AppColors.white),
            primary: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    // Text theme
    textTheme: TextTheme(
        headline1:
            getSemiBoldStyle(color: AppColors.darkGrey, fontSize: FontSize.s16),
        subtitle1:
            getMediumStyle(color: AppColors.lightGrey, fontSize: FontSize.s14),
        caption: getRegularStyle(color: AppColors.grey1),
        bodyText1: getRegularStyle(color: AppColors.grey)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      // hind style
      hintStyle: getRegularStyle(color: AppColors.grey1),
      // label style
      labelStyle: getRegularStyle(color: AppColors.darkGrey),
      // error style
      errorStyle: getRegularStyle(color: AppColors.error),
      // enable border
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      // focused border
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      // error border
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
    ),
  );
}
