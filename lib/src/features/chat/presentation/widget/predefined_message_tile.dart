import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class PredefinedMessageTile extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final bool isSelected;
  final VoidCallback onTap;

  const PredefinedMessageTile({
    super.key,
    required this.title,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 50),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            decoration: BoxDecoration(
              color: backgroundColor ?? (isSelected ? AppColors.yellow07 : Colors.white),
              border: borderColor != null ? Border.all(color: borderColor!) : null,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BrandText.primary(
                  data: title,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontColor: textColor ?? Colors.black,
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
