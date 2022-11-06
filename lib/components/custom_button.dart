import 'package:base_bloc/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Decoration? decoration;
  final VoidCallback onTap;
  final Widget widget;
  final BorderRadius? borderRadius;
  final bool isCenter;
  final EdgeInsets? padding;

  const CustomButton(
      {Key? key,
      this.height,
      this.width,
      this.decoration,
      this.padding,
      required this.onTap,
      this.isCenter = false,
      required this.widget,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorTransparent,
      child: Ink(
        padding: padding,
        height: height,
        width: width,
        decoration: decoration ?? BoxDecoration(color: colorWhite),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: isCenter ? Center(child: widget) : widget,
        ),
      ),
    );
  }
}
