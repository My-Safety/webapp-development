import 'package:flutter/material.dart';

class ActionBox extends StatelessWidget {
  final String title;
  final String assetPath;
  final VoidCallback? onTap;

  const ActionBox({
    super.key,
    required this.title,
    required this.assetPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(11, 35, 70, 0.48),
              Color.fromRGBO(46, 89, 151, 0.48),
              Color.fromRGBO(19, 43, 77, 0.48),
            ],
            stops: [0.0, 0.4471, 0.9327],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(assetPath, height: 40, width: 40, fit: BoxFit.contain),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
