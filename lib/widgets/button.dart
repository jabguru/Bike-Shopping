import 'package:bike_shopping/theme/theme.dart';
import 'package:bike_shopping/widgets/gradient_stroke.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GradientStroke(
      child: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.linearGradient,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(padding: EdgeInsets.all(12.0), child: child),
      ),
    );
  }
}
