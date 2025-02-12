import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantitySelector extends StatefulWidget {
  final Function(int)? onChanged;
  final int initialQuantity;

  const QuantitySelector({
    super.key,
    this.onChanged,
    this.initialQuantity = 1,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() => _quantity--);
      widget.onChanged?.call(_quantity);
    }
  }

  void _increment() {
    setState(() => _quantity++);
    widget.onChanged?.call(_quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Decrement Button
        ElevatedButton(
          onPressed: _decrement,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(24, 24),
            backgroundColor: AppColors.colorFoundationSurfaceWhite,
            shape: const CircleBorder(),
            elevation: 2,
            //shadowColor: Colors.grey.withValues( alpha: 0.3),
            side: const BorderSide(
              color: AppColors.colorFoundationBrownLight,
            )
          ),
          child: Icon(
            Icons.remove,
            size: 20,
            color: AppColors.colorFoundationGreyNormalHover,
          ),
        ),
        
        // Quantity Display
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '$_quantity',
            style: GoogleFonts.sora(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.colorFoundationGreyNormalHover,
              
            ),
          ),
        ),
        
        ElevatedButton(
          onPressed: _increment,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(24, 24),
            backgroundColor: AppColors.colorFoundationSurfaceWhite,
            shape: const CircleBorder(),
            elevation: 2,
            //shadowColor: Colors.grey.withValues( alpha: 0.3),
            side: const BorderSide(
              color: AppColors.colorFoundationBrownLight,
            )
          ),
          child: const Icon(
            Icons.add,
            size: 20,
            color: AppColors.colorFoundationGreyNormalHover,
          ),
        ),
      ],
    );
  }
}