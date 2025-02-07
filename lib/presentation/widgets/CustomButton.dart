// lib/core/widgets/custom_button.dart
import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.colorFoundationBrownNormal,
    this.textColor = AppColors.colorFoundationSurfaceWhite,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.sora(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}