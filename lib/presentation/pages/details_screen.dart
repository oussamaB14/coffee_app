import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:coffee_app/presentation/widgets/app_Text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          'Details',
          textAlign: TextAlign.center,
          style: GoogleFonts.sora(
            //fontSize: 32,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.heart),
          )
        ],
        //leading: Icon(IconlyLight.arrow_left_2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/Coffee/1.png')),
            SizedBox(
              height: 12,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              AppText(
                'Coffee Mocha',
                style: AppText.titleLarge(context),
                //: TextAlign.start,
              ),
              //SizedBox(height: 2),
              Row(
                spacing: 12,
                children: [
                  AppText(
                    'Ice/Hot',
                    style: AppText.bodySmall(context),
                    color: AppColors.colorFoundationGreyLighter,
                    //: TextAlign.start,
                  ),
                  Spacer(),
                  customIconContainer('assets/icons/motorbike 1.svg'),
                  customIconContainer('assets/icons/coffee-bean.svg'),
                  customIconContainer('assets/icons/packaging.svg'),
                ],
              ),
              Row(
                children: [
                  Icon(IconlyBold.star, color: AppColors.colorFoundationGold),
                  SizedBox(width: 4),
                  AppText(
                    '4.8',
                    style: AppText.rating(context),
                  ),
                  SizedBox(width: 2),
                  AppText(
                    '(257)',
                    style: AppText.bodySmall(context),
                    color: AppColors.colorFoundationGreyLighter,
                  ),
                ],
              ),
              Divider(
                color: AppColors.colorFoundationSurfaceLightActive,
                height: 16,
                indent: 10,
                endIndent: 10,
              ),
              SizedBox(height: 5),
              AppText('Description', style: AppText.titleSmall(context)),
              SizedBox(height: 12),
              expandableText(
                context,
                'lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              ),
              SizedBox(height: 16),
              AppText('Size', style: AppText.titleSmall(context)),
              SizedBox(height: 12),
              sizeSelection(context),
              SizedBox(height: 16),
              _buildBottomPriceBar(
                //price: 4.53,
                //onPressed: () => _handleAddToCart(),
              )
            ])
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: [],
      // backgroundColor: AppColors.colorFoundationBrownDark,),
    );
  }
}

Widget customIconContainer(String assetPath) {
  Widget icon = SvgPicture.asset(
    width: 24.0,
    height: 24.0,
    assetPath,
    colorFilter:
        ColorFilter.mode(AppColors.colorFoundationBrownNormal, BlendMode.srcIn),
  );

  if (assetPath.contains('motorbike 1.svg')) {
    icon = Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scale(-1.0, 1.0),
      child: icon,
    );
  }

  return Container(
    width: 44.0,
    height: 44.0,
    decoration: BoxDecoration(
      color: AppColors.colorFoundationGreyLightActive.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(10),
    child: icon,
  );
}

Widget expandableText(BuildContext context, String text) {
  const int previewLength = 100;

  return Builder(
    builder: (context) {
      bool isLongText = text.length > previewLength;
      String previewText =
          isLongText ? '${text.substring(0, previewLength)}...' : text;

      return GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.colorFoundationGreyDark,
            content: SingleChildScrollView(
              child: AppText(
                text,
                style: AppText.bodyMedium(context),
                color: AppColors.colorFoundationGreyLighter,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: AppText(
                  "Close",
                  style: AppText.bodySmall(context),
                  color: AppColors.colorFoundationBrownNormal,
                ),
              ),
            ],
          ),
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: previewText,
                style: AppText.bodySmall(context).copyWith(
                  color: AppColors.colorFoundationGreyLighter,
                ),
              ),
              if (isLongText)
                TextSpan(
                  text: " Read More",
                  style: AppText.bodySmall(context).copyWith(
                    color: AppColors.colorFoundationBrownNormal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}

Widget sizeSelection(BuildContext context) {
  ValueNotifier<String> selectedSize =
      ValueNotifier<String>("M"); // Default selected size

  return ValueListenableBuilder<String>(
    valueListenable: selectedSize,
    builder: (context, value, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ["S", "M", "L"].map((size) {
          bool isSelected = value == size;

          return GestureDetector(
            onTap: () => selectedSize.value = size,
            child: Container(
              width: 96,
              height: 41,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? AppColors.colorFoundationBrownNormal
                      : AppColors.colorFoundationGreyLighter,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
                color: isSelected
                    ? AppColors.colorFoundationBrownNormal
                        .withValues(alpha: 0.1)
                    : Colors.transparent,
              ),
              child: Text(
                size,
                style: AppText.bodyMedium(context).copyWith(
                  color: isSelected
                      ? AppColors.colorFoundationBrownNormal
                      : AppColors.colorFoundationGreyLighter,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      );
    },
  );
}

Widget _buildBottomPriceBar() {
  return Container(
    height: 80,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 8,
          offset: const Offset(0, -2),
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Price',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            Text(
              '\$price',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.colorFoundationBrownDark,
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.colorFoundationBrownNormal,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            // Handle purchase
          },
          child: const Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
