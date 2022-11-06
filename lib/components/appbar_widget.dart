import 'package:base_bloc/base/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../theme/app_styles.dart';
import '../theme/colors.dart';
import 'app_text.dart';

PreferredSizeWidget appBarWidget(
        {required BuildContext context,
        Widget? leading,
        Widget? title,
        double? titleSpacing = 16,
        double? leadingWidth = 0,
        bool centerTitle = false,
        double? toolbarHeight,
        String? titleStr,
        Color? backgroundColor,
        List<Widget>? action,
        bool isHideBottomBar = false,
        bool automaticallyImplyLeading = true}) =>
    AppBar(
        toolbarHeight: toolbarHeight,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leadingWidth: leadingWidth,
        centerTitle: centerTitle,
        leading: leading,
        titleSpacing: titleSpacing,
        elevation: 0,
        title: title ??
            AppText(
              titleStr ?? '',
              style: typoW600.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: colorText0.withOpacity(0.87)),
            ),
        backgroundColor: backgroundColor ?? colorBlack,
        actions: action,
        flexibleSpace: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: HexColor('BA3435'),
                image: DecorationImage(
                    image: AssetImage(Assets.png.backgroundAppbar.path),
                    fit: BoxFit.fitWidth))));
