import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:coffee_app/presentation/widgets/_OrderScreenWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Order",
            style: GoogleFonts.sora(
              fontWeight: FontWeight.w600,
              color: AppColors.colorFoundationGreyNormalActive,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.colorFoundationSurfaceLightHover,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                tabs: [
                  Tab(text: 'Deliver'),
                  Tab(text: 'Pick Up'),
                ],
                indicator: BoxDecoration(
                  color: AppColors.colorFoundationBrownNormal,
                  borderRadius: BorderRadius.circular(10),
                ),
                labelColor: AppColors.colorFoundationSurfaceWhite,
                unselectedLabelColor: AppColors.colorFoundationGreyNormal,
                labelStyle: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0,
                indicatorPadding: EdgeInsets.all(4),
                dividerColor: Colors.transparent,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            OrderScreenWidgets(),
            Center(child: Text("Pick Up Content")),
          ],
        ),
      ),
    );
  }
}
