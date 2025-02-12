import 'package:coffee_app/app/routes/routes.dart';
import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:coffee_app/presentation/widgets/CustomButton.dart';
import 'package:coffee_app/presentation/widgets/app_Text.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Adjusted image position with Positioned
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Coffee/6.png',
              fit: BoxFit.cover,
            ),
          ),

          // Content container at bottom
          Container(
            height: screenHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xCC000000),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: AppText(
                          'Fall in Love with\nCoffee in Blissful\nDelight!',
                          style: AppText.titleLanding(context),
                          color: AppColors.colorFoundationSurfaceWhite,
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 16),
                      Center(
                        child: AppText(
                          'Welcome to our cozy coffee corner, where\n'
                          'every cup is a delightful for you.',
                          style: AppText.bodyMedium(context),
                          color: AppColors.colorFoundationGreyLighter,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 32),
                      CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.wrapper);
                        },
                        text: 'Get Started',
                      ),
                      const SizedBox(height: 40), // Bottom spacing
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
