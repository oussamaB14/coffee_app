import 'package:coffee_app/app/theme/app_collors.dart';
import 'package:coffee_app/data/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeTypeSelector extends StatefulWidget {
  const CoffeeTypeSelector({super.key});

  @override
  State<CoffeeTypeSelector> createState() => _CoffeeTypeSelectorState();
}

class _CoffeeTypeSelectorState extends State<CoffeeTypeSelector> {
  CoffeeType selectedCoffeeType = CoffeeType.latte;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: CoffeeType.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final type = CoffeeType.values[index];
          return CoffeeTypeChip(
            type: type,
            isSelected: selectedCoffeeType == type,
            onSelected: (selected) {
              setState(() => selectedCoffeeType = type);
            },
          );
        },
      ),
    );
  }
}

class CoffeeTypeChip extends StatelessWidget {
  final CoffeeType type;
  final bool isSelected;
  final Function(bool) onSelected;

  const CoffeeTypeChip({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onSelected,
  });

  String get displayName {
    switch (type) {
      case CoffeeType.machiato:
        return 'Cold Brew';
      default:
        return type.name[0].toUpperCase() + type.name.substring(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(displayName),
      selected: isSelected,
      onSelected: onSelected,
      showCheckmark: false,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        fontSize: isSelected ? 16 : 14,
      ),
      backgroundColor: Colors.grey[200],
      selectedColor: AppColors.colorFoundationBrownNormal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: isSelected 
              ? AppColors.colorFoundationBrownNormal 
              : Colors.grey[300]!,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
    );
  }
}