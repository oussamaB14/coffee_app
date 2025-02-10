import 'package:coffee_app/app/routes/routes.dart';
import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:coffee_app/data/models/coffee.dart';
import 'package:coffee_app/presentation/widgets/_CoffeeCard.dart';
import 'package:coffee_app/presentation/widgets/_CoffeeTypeSelectorState.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double headerHeight = MediaQuery.of(context).size.height * 0.3;
    final double promoCardHeight = MediaQuery.of(context).size.height * 0.15;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: headerHeight +
                        promoCardHeight / 2, // Total height of Stack
                  ),
                  // Header Section
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: headerHeight,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff111111), Color(0xff303030)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          _buildLocationWidget(),
                          const SizedBox(height: 24),
                          _buildSearchBar(),
                        ],
                      ),
                    ),
                  ),
                  // Promo Card Section
                  Positioned(
                    left: 16,
                    right: 16,
                    top: headerHeight - promoCardHeight / 2,
                    child: _buildPromoCard(context, promoCardHeight),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CoffeeTypeSelector(),
              GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: coffees.length,
                itemBuilder: (context, index) {
                  final coffee = coffees[index];
                  return CoffeeCard(
                    name: coffee.name,
                    price: coffee.price,
                    image: coffee.image,
                    rating: coffee.rate,
                    description: coffee.type.toString().split('.').last,
                    onFavoritePressed: () {},
                    onTap: () {
                      // Handle card tap
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLocationWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(
              color: AppColors.colorFoundationGreyLighter, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Row(
          children: const [
            Text(
              'Bilzen, Tanjungbalai',
              style: TextStyle(
                  color: AppColors.colorFoundationSurfaceLightActive,
                  fontSize: 18),
            ),
            SizedBox(width: 8),
            Icon(
              IconlyLight.arrow_down_2,
              color: Colors.white,
              size: 16,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0xff303030),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(IconlyLight.search, color: Colors.white54),
                hintText: 'Search coffee',
                hintStyle: GoogleFonts.sora(
                  fontSize: 16,
                  color: AppColors.colorFoundationGreyLighter,
                ),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: AppColors.colorFoundationBrownNormal,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            IconlyLight.filter,
            color: Colors.white,
            size: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildPromoCard(BuildContext context, double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/Coffee/Banner.png',
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}