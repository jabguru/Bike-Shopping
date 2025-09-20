import 'package:bike_shopping/theme/theme.dart';
import 'package:bike_shopping/widgets/gradient_stroke.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required this.child,
    this.width,
    this.height,
    this.backgroundGradient,
    super.key,
  });
  final Widget child;
  final double? width;
  final double? height;
  final LinearGradient? backgroundGradient;

  @override
  Widget build(BuildContext context) {
    return GradientStroke(
      width: width ?? 44.0,
      height: height ?? 44.0,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: backgroundGradient ?? AppTheme.linearGradient,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(padding: EdgeInsets.all(12.0), child: child),
      ),
    );
  }
}
