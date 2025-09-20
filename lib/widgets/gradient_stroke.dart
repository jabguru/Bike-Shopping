import 'package:bike_shopping/theme/theme.dart';
import 'package:flutter/material.dart';

class GradientStroke extends StatelessWidget {
  const GradientStroke({
    required this.child,
    required this.width,
    required this.height,
    this.blendMode = BlendMode.srcOver,
    this.opacity = 1.0,
    super.key,
  });
  final Widget child;
  final double width;
  final double height;
  final BlendMode blendMode;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        CustomPaint(
          painter: GradientStrokePainter(
            blendMode: blendMode,
            opacity: opacity,
          ),
          size: Size(width, height),
        ),
      ],
    );
  }
}

class GradientStrokePainter extends CustomPainter {
  GradientStrokePainter({required this.blendMode, required this.opacity});
  final BlendMode blendMode;
  final double opacity;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = AppTheme.neutralGradient
          .withOpacity(opacity)
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..blendMode = blendMode
      ..strokeWidth = 1.0;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rRect = RRect.fromRectAndRadius(rect, Radius.circular(10.0));

    canvas.drawRRect(rRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
