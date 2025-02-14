import 'package:coffee_app/app/routes/routes.dart';
import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:coffee_app/presentation/widgets/CustomButton.dart';
import 'package:coffee_app/presentation/widgets/_QuantitySelector.dart';
import 'package:coffee_app/presentation/widgets/app_Text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class OrderScreenWidgets extends StatelessWidget {
  const OrderScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Delivery Adress',
              style: AppText.titleMedium(context),
              color: AppColors.colorFoundationGreyNormalActive,
            ),
            SizedBox(height: 8),
            AppText(
              'Jl. Kpg Sutoyo',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.colorFoundationGreyNormal,
              ),
            ),
            SizedBox(height: 8),
            AppText(
              'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.colorFoundationGreyLighter,
              ),
            ),
            Row(
              spacing: 10,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(
                    IconlyLight.edit_square,
                    color: AppColors.colorFoundationGreyNormal,
                    size: 16,
                  ),
                  label: Text(
                    'Edit Address',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    // Handle edit address
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.colorFoundationSurfaceWhite,
                    foregroundColor: AppColors.colorFoundationGreyNormal,
                    side: BorderSide(
                      color: AppColors.colorFoundationGreyLighter,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    minimumSize: Size(0, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                OutlinedButton.icon(
                  icon: const Icon(
                    IconlyLight.paper,
                    color: AppColors.colorFoundationGreyNormal,
                    size: 16,
                  ),
                  label: Text(
                    'Add Note',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    // Handle edit address
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.colorFoundationGreyNormal,
                    backgroundColor: AppColors.colorFoundationSurfaceWhite,
                    side: BorderSide(
                      color: AppColors.colorFoundationGreyLighter,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    minimumSize: Size(0, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.colorFoundationSurfaceLightActive,
              height: 16,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(height: 4),
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/Coffee/2.png',
                  width: 54,
                  height: 54,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText('Caffe Mocha', style: AppText.titleMedium(context)),
                  AppText(
                    'Deep Foam',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    color: AppColors.colorFoundationGreyLighter,
                  )
                ],
              ),
              Spacer(),
              QuantitySelector(
                initialQuantity: 2,
                onChanged: (newQuantity) {},
              )
            ]),
            SizedBox(height: 8),
            Divider(color: AppColors.colorFoundationBrownLight, thickness: 4),
            SizedBox(height: 8),
            buildDiscountButton(() {}),
            SizedBox(height: 8),
            AppText(
              'Payment Summary',
              style: AppText.titleMedium(context),
              color: AppColors.colorFoundationGreyNormalActive,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('price', style: AppText.bodySmall(context)),
                AppText('\$4.53', style: AppText.bodyMedium(context)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              spacing: 4,
              children: [
                AppText('Delivery Fee', style: AppText.bodySmall(context)),
                Spacer(),
                AppText(
                  '\$2.0',
                  style: AppText.bodySmall(context).copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.grey,
                    decorationThickness: 2,
                  ),
                ),
                AppText('\$1.0', style: AppText.bodyMedium(context)),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
      bottomNavigationBar: buildBottomOrderBar(context),
    );
  }
}

Widget buildDiscountButton(VoidCallback onPressed) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      backgroundColor: AppColors.colorFoundationSurfaceWhite,
      foregroundColor: AppColors.colorFoundationGreyDarkHover,
      side:
          const BorderSide(color: AppColors.colorFoundationSurfaceWhiteActive),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(IconlyLight.discount,
            size: 18, color: AppColors.colorFoundationBrownNormal),
        const SizedBox(width: 8),
        Text(
          "Apply Discount",
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.colorFoundationGreyNormal,
          ),
        ),
        const Spacer(),
        const Icon(IconlyLight.arrow_right_2,
            size: 18, color: AppColors.colorFoundationGreyNormalHover),
      ],
    ),
  );
}

Widget buildBottomOrderBar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: (0.1)),
          spreadRadius: 2,
          blurRadius: 8,
          offset: const Offset(0, -2),
        )
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(IconlyLight.wallet,
                    color: AppColors.colorFoundationBrownNormal, size: 20),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cash/Wallet',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorFoundationGreyNormalActive,
                      ),
                    ),
                    Text(
                      '\$5.53',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorFoundationBrownNormal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_down,
                color: AppColors.colorFoundationGreyNormalHover),
          ],
        ),
        const SizedBox(height: 4),
        const SizedBox(height: 12),
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.delivery);
          },
          text: 'Order',
        ),
      ],
    ),
  );
}
