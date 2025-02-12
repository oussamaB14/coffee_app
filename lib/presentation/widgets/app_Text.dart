// lib/core/widgets/custom_text.dart
import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.color,
  });

  // Custom text styles
  static TextStyle titleLarge(BuildContext context) {
    return GoogleFonts.sora(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.colorFoundationGreyNormalActive,
    );
  }

  static TextStyle titleMedium(BuildContext context) {
    return GoogleFonts.sora(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle titleSmall(BuildContext context) {
    return GoogleFonts.sora(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.colorFoundationGreyNormalActive,
    );
  }

  static TextStyle bodyLarge(BuildContext context) {
    return GoogleFonts.sora(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return GoogleFonts.sora(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );
  }

  static TextStyle bodySmall(BuildContext context) {
    return GoogleFonts.sora(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppColors.colorFoundationGreyNormal,
    );
  }
   static TextStyle rating(BuildContext context) {
    return GoogleFonts.sora(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.colorFoundationGreyDarkHover,
    );
  }
   static TextStyle titleLanding(BuildContext context) {
    return GoogleFonts.sora(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: AppColors.colorFoundationGreyNormalActive,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(color: color) ?? TextStyle(color: color),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}