import 'package:bike_shopping/theme/colors.dart';
import 'package:bike_shopping/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.width = 60,
    this.height = 60.0,
    required this.child,
    this.isBottomRightSkew = false,
    this.hasStroke = false,
    this.isCentered = false,
  });
  final double width;
  final double height;
  final Widget child;
  final bool isBottomRightSkew;
  final bool hasStroke;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isCentered ? Alignment.center : AlignmentDirectional.topStart,
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: isBottomRightSkew
                  ? BottomRightSkewPainter()
                  : FullSkewPainter(),
              size: Size(width, height),
            ),
            if (hasStroke)
              CustomPaint(
                painter: isBottomRightSkew
                    ? BottomRightSkewPainter(isStroke: true)
                    : FullSkewPainter(isStroke: true),
                size: Size(width, height),
              ),
          ],
        ),
        child,
      ],
    );
  }
}

class FullSkewPainter extends CustomPainter {
  const FullSkewPainter({this.isStroke = false});
  final bool isStroke;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = 10.0;

    final path = Path()
      ..moveTo(radius, size.height)
      ..lineTo(size.width - radius + 5, size.height * 0.75)
      ..quadraticBezierTo(
        size.width,
        size.height * 0.75,
        size.width,
        size.height * 0.75 - radius,
      )
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(radius - 5, size.height * 0.25)
      ..quadraticBezierTo(0, size.height * 0.25, 0, size.height * 0.25 + radius)
      ..lineTo(0, size.height - radius)
      ..quadraticBezierTo(0, size.height, radius, size.height)
      ..close();

    if (isStroke) {
      final paint = Paint()
        ..shader = AppTheme.neutralGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        )
        ..style = PaintingStyle.stroke
        ..blendMode = BlendMode.overlay
        ..strokeWidth = 1.0;

      canvas.drawPath(path, paint);
    } else {
      final fillPaint = Paint()
        ..shader = AppTheme.linearGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        );
      canvas.drawPath(path, fillPaint);
      canvas.drawShadow(
        path,
        AppColors.shadow.withValues(alpha: .60),
        30,
        true,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BottomRightSkewPainter extends CustomPainter {
  const BottomRightSkewPainter({this.isStroke = false});
  final bool isStroke;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = 20.0;

    final path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height * 0.85 - radius)
      ..quadraticBezierTo(
        size.width,
        size.height * 0.85,
        size.width - radius,
        size.height * 0.85,
      )
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)
      ..lineTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..close();

    if (isStroke) {
      LinearGradient strokeGradient = LinearGradient(
        colors: [
          Color(0xFFFFFFFF).withValues(alpha: 0.2),
          Color(0xFF000000).withValues(alpha: 0.2),
          Color(0xFF000000).withValues(alpha: 0.2),
        ],
        stops: [0, 0.84, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

      final paint = Paint()
        ..shader = strokeGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        )
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      canvas.drawPath(path, paint);
    } else {
      final fillPaint = Paint()
        ..shader = AppTheme.greyBlueGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        )
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3);
      canvas.drawPath(path, fillPaint);
      canvas.drawShadow(
        path,
        AppColors.shadow.withValues(alpha: .60),
        60,
        true,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
