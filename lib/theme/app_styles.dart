import 'package:base_bloc/data/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final decorTextField = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
  hintStyle: typoW400.copyWith(color: colorNeutralDark40.withOpacity(0.4)),
  errorStyle: typoW400.copyWith(color: colorSemanticRed100),
  counterText: '',
  fillColor: Colors.white,
  filled: true,
);

final decorScreenContainerSelect = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(20)),
  boxShadow: boxShadowSelectBox,
  color: colorWhite,
);

final decorScreenContainer = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  boxShadow: boxShadow,
  color: colorWhite,
);

const decorScreenContainerNoShadow = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  color: colorWhite,
);

final decorContainerBox = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  boxShadow: boxShadow,
  color: colorWhite,
);

final boxShadow = [
  BoxShadow(
    color: colorBlack.withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(0, 0),
  ),
];

final boxShadowFocus = [
  BoxShadow(
    color: colorBlack.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 40,
    offset: const Offset(0, 10),
  ),
];

final boxShadowSelectBox = [
  BoxShadow(
    color: colorBlack.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 5,
    offset: const Offset(0, 4),
  ),
];
final googleFont = GoogleFonts.nunito(letterSpacing: 0.3, color: colorText100);
final typoW400 = GoogleFonts.nunito(
    letterSpacing: 0.3, color: colorText100, fontWeight: FontWeight.w400);
final typoW500 = GoogleFonts.nunito(
    letterSpacing: 0.3, color: colorText100, fontWeight: FontWeight.w500);
final typoW600 = GoogleFonts.nunito(
    letterSpacing: 0.3, color: colorText100, fontWeight: FontWeight.w600);
final typoW700 = GoogleFonts.nunito(
    letterSpacing: 0.3, color: colorText100, fontWeight: FontWeight.w700);

final decorTextFieldCircle = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorWhite, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
  contentPadding:
  EdgeInsets.only(left: contentPadding, top: 10.h, bottom: 10.h, right: 5.w),
  hintStyle: typoW400.copyWith(
      color: colorNeutralDark40.withOpacity(0.4)),
  errorStyle: typoW400.copyWith(color: colorSemanticRed100),
  counterText: '',
  fillColor: Colors.white,
  filled: true,
);
