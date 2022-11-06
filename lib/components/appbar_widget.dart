import 'package:base_bloc/base/hex_color.dart';
import 'package:base_bloc/data/globals.dart';
import 'package:base_bloc/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/assets.gen.dart';
import '../theme/app_styles.dart';
import '../theme/colors.dart';
import 'app_text.dart';

PreferredSizeWidget appBarWidget(
        {required BuildContext context,
        Widget? leading,
        Widget? title,
        double? titleSpacing = 16,
        double? leadingWidth,
        bool centerTitle = false,
        double? toolbarHeight,
        String? titleStr,
        Color? backgroundColor,
        List<Widget>? action,
        bool isBack = false,
        bool automaticallyImplyLeading = true}) =>
    AppBar(
        toolbarHeight: toolbarHeight,
        automaticallyImplyLeading: automaticallyImplyLeading,
        leadingWidth: leadingWidth,
        centerTitle: centerTitle,
        leading: leading ??
            (isBack
                ? InkWell(
                    child: Padding(
                      padding: EdgeInsets.only(left: contentPadding),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                      ),
                    ),
                    onTap: () => RouterUtils.pop(context),
                  )
                : const SizedBox()),
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
