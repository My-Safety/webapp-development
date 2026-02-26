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
      padding: const EdgeInsets.all(20.0),
      child: BrandRoundedContainer(
        borderColor: AppColors.white.withAlpha(40),
        borderRadius: 8,
        color: AppColors.primary,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BrandText.white(data: title),
            ),

            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BrandText(data: "Insurance"),
                            BrandText(data: insuranceName ,textStyle: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),

                      BrandHSpace.gap18(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        
                          children: [
                            BrandText(data: "Policy No."),
                        
                            BrandText(data: policyNumber,textStyle: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
