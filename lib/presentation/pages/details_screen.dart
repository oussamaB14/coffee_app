import 'package:coffee_app/app/routes/routes.dart';
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
            fontWeight: FontWeight.w600,
            color: AppColors.colorFoundationGreyNormalActive,
          ),
        ),
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left_2,
              color: AppColors.colorFoundationGreyNormalActive),
          onPressed: () => Navigator.pop(context),
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
        child: SingleChildScrollView(
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
                //SizedBox(height: 16),
              ])
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomPriceBar(context),
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
  const int previewLength = 200;

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

BottomAppBar _buildBottomPriceBar(BuildContext context) {
  return BottomAppBar(
    elevation: 8,
    color: Colors.white,
    shape: const CircularNotchedRectangle(),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.colorFoundationGreyLightHover,
              ),
            ),
            Text(
              '\$4.53',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.colorFoundationBrownNormal,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 217,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.colorFoundationBrownNormal,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.order);
            },
            child: const Text(
              'Buy Now',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.colorFoundationSurfaceWhite,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
