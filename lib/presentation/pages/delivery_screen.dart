import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.gps_fixed, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(36.8665, 10.1647),
              initialZoom: 16.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              const RichAttributionWidget(
                attributions: [
                  TextSourceAttribution('OpenStreetMap contributors'),
                ],
              ),
            ],
          ),
          // Delivery Status Card
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(
                    thickness: 4,
                    indent: 150,
                    endIndent: 150,
                    color: AppColors.colorFoundationSurfaceLightActive,
                  ),
                  Text(
                    '10 minutes left',
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.colorFoundationGreyNormalActive,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Delivery to ', // Normal text
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        color: AppColors.colorFoundationGreyLighter,
                      ),
                      children: [
                        TextSpan(
                          text: 'Jl.Kpg Sutoyo', 
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.bold, 
                            color: AppColors.colorFoundationGreyNormalHover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: AppColors.colorFoundationSurfaceLightActive,
                      ),
                    ),
                    color: Colors.white, // Background color
                    elevation: 0, // No shadow for a clean look
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Container(
                            width: 44.0,
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: AppColors.colorFoundationSurfaceLightActive
                                  .withValues(alpha: (0.1)),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color:
                                    AppColors.colorFoundationSurfaceLightActive,
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..scale(-1.0, 1.0),
                              child: SvgPicture.asset(
                                'assets/icons/motorbike 1.svg',
                                width: 24.0,
                                height: 24.0,
                                colorFilter: ColorFilter.mode(
                                  AppColors.colorFoundationBrownNormal,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivered your order',
                                style: GoogleFonts.sora(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors
                                      .colorFoundationGreyNormalActive, // Ensure contrast
                                ),
                              ),
                              Text(
                                'We will deliver your goods to you in\nthe shortest possible time.',
                                style: GoogleFonts.sora(
                                  fontSize: 12,
                                  color: AppColors.colorFoundationGreyLighter,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/person.png',
                          width: 54,
                          height: 54,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brooklyn Simmons',
                            style: GoogleFonts.sora(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Personal Courier',
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: BoxDecoration(
                          color: AppColors.colorFoundationSurfaceLightActive
                              .withValues(alpha: (0.1)),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.colorFoundationSurfaceLightActive,
                          ),
                        ),
                        child: Icon(IconlyLight.calling,
                            size: 24,
                            color: AppColors.colorFoundationGreyNormalHover),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
