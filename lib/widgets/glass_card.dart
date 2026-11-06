import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  // Using the modern super.key syntax
  const GlassCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Updated from .withOpacity to .withValues
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
        ),
      ),
      child: child,
    );
  }
}