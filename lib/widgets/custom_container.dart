import 'dart:ui';

import 'package:bike_shopping/theme/colors.dart';
import 'package:bike_shopping/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.width = 60,
    this.height = 60.0,
    this.isBottomRightSkew = false,
    this.hasStroke = false,
    this.isCentered = false,
    this.isBlur = false,
    required this.radius,
    required this.child,
    required this.gradient,
  });
  final double width;
  final double height;
  final Widget child;
  final bool isBottomRightSkew;
  final bool hasStroke;
  final bool isCentered;
  final bool isBlur;
  final LinearGradient gradient;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isCentered ? Alignment.center : AlignmentDirectional.topStart,
      children: [
        if (isBlur)
          ClipPath(
            clipper: CustomContainerClipper(
              isBottomRightSkew: isBottomRightSkew,
              radius: radius,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(gradient: gradient),
              ),
            ),
          ),
        Stack(
          children: [
            if (!isBlur)
              CustomPaint(
                painter: isBottomRightSkew
                    ? BottomRightSkewPainter(radius: radius)
                    : FullSkewPainter(gradient: gradient, radius: radius),
                size: Size(width, height),
              ),
            if (hasStroke)
              CustomPaint(
                painter: isBottomRightSkew
                    ? BottomRightSkewPainter(isStroke: true, radius: radius)
                    : FullSkewPainter(
                        isStroke: true,
                        gradient: gradient,
                        radius: radius,
                      ),
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
  const FullSkewPainter({
    this.isStroke = false,
    required this.gradient,
    required this.radius,
  });
  final bool isStroke;
  final LinearGradient gradient;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = CustomPaths.fullSkewPath(size, radius);

    if (isStroke) {
      final paint = Paint()
        ..shader = AppTheme.neutralGradient
            .withOpacity(0.6)
            .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..style = PaintingStyle.stroke
        ..blendMode = BlendMode.overlay
        ..strokeWidth = 1.0;

      canvas.drawPath(path, paint);
    } else {
      final fillPaint = Paint()
        ..shader = gradient.createShader(
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
  const BottomRightSkewPainter({this.isStroke = false, required this.radius});
  final bool isStroke;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = CustomPaths.bottomRightKewPath(size, radius);

    if (isStroke) {
      LinearGradient strokeGradient = LinearGradient(
        colors: [Color(0xFFFFFFFF), Color(0xFF000000), Color(0xFF000000)],
        stops: [0, 0.84, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

      final paint = Paint()
        ..shader = strokeGradient
            .withOpacity(0.2)
            .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      canvas.drawPath(path, paint);
    } else {
      final fillPaint = Paint()
        ..shader = AppTheme.greyBlueGradient
            .withOpacity(0.6)
            .createShader(Rect.fromLTWH(0, 0, size.width, size.height));
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

class CustomContainerClipper extends CustomClipper<Path> {
  CustomContainerClipper({
    required this.isBottomRightSkew,
    required this.radius,
  });

  final bool isBottomRightSkew;
  final double radius;

  @override
  Path getClip(Size size) {
    if (isBottomRightSkew) {
      return CustomPaths.bottomRightKewPath(size, radius);
    } else {
      return CustomPaths.fullSkewPath(size, radius);
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CustomPaths {
  static Path bottomRightKewPath(Size size, double radius) {
    // final radius = 20.0;
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
    return path;
  }

  static Path fullSkewPath(Size size, double radius) {
    // final radius = 10.0;
    final path = Path()
      ..moveTo(radius, size.height)
      ..lineTo(size.width - radius + (radius / 2), size.height * 0.85)
      ..quadraticBezierTo(
        size.width,
        size.height * 0.85,
        size.width,
        size.height * 0.85 - radius,
      )
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(radius - (radius / 2), size.height * 0.15)
      ..quadraticBezierTo(0, size.height * 0.15, 0, size.height * 0.15 + radius)
      ..lineTo(0, size.height - radius)
      ..quadraticBezierTo(0, size.height, radius, size.height)
      ..close();
    return path;
  }
}
