import 'package:flutter/material.dart';
import 'package:mysafety_design_system/design_system/design_system.dart';

class InsurenceCard extends StatelessWidget {
  final String title;
  final String insuranceName;
  final String policyNumber;

  const InsurenceCard({
    super.key,
    required this.title,
    required this.insuranceName,
    required this.policyNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 6),
      child: BrandRoundedContainer(
        borderColor: AppColors.white.withAlpha(40),
        borderRadius: 8,
        color: const Color(0xFF101526),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BrandText.white(data: title, fontWeight: FontWeight.w600),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: AppColors.white,
              ),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BrandText(data: 'Insurance'),
                        const SizedBox(height: 4),
                        BrandText(
                          data: insuranceName.trim().isEmpty
                              ? '--'
                              : insuranceName,
                          maxLines: 2,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BrandText(data: 'Policy No.'),
                        const SizedBox(height: 4),
                        BrandText(
                          data: policyNumber.trim().isEmpty
                              ? '--'
                              : policyNumber,
                          maxLines: 2,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
