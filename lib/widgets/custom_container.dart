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
    this.hasShadow = false,
    this.blurSigma = 50.0,
    required this.radius,
    required this.child,
    required this.gradient,
    required this.skewRatio,
  });
  final double width;
  final double height;
  final Widget child;
  final bool isBottomRightSkew;
  final bool hasStroke;
  final bool isCentered;
  final bool isBlur;
  final bool hasShadow;
  final LinearGradient gradient;
  final double radius;
  final double blurSigma;
  final double skewRatio;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isCentered ? Alignment.center : AlignmentDirectional.topStart,
      children: [
        Stack(
          children: [
            CustomPaint(
              painter: isBottomRightSkew
                  ? BottomRightSkewPainter(
                      radius: radius,
                      hasShadow: hasShadow,
                      isBlur: isBlur,
                      skewRatio: skewRatio,
                    )
                  : FullSkewPainter(
                      gradient: gradient,
                      radius: radius,
                      hasShadow: hasShadow,
                      isBlur: isBlur,
                      skewRatio: skewRatio,
                    ),
              size: Size(width, height),
            ),
            if (isBlur)
              ClipPath(
                clipper: CustomContainerClipper(
                  isBottomRightSkew: isBottomRightSkew,
                  radius: radius,
                  skewRatio: skewRatio,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurSigma,
                    sigmaY: blurSigma,
                  ),
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(gradient: gradient),
                  ),
                ),
              ),
            if (hasStroke)
              CustomPaint(
                painter: isBottomRightSkew
                    ? BottomRightSkewPainter(
                        isStroke: true,
                        radius: radius,
                        isBlur: isBlur,
                        hasShadow: hasShadow,
                        skewRatio: skewRatio,
                      )
                    : FullSkewPainter(
                        isStroke: true,
                        gradient: gradient,
                        radius: radius,
                        isBlur: isBlur,
                        hasShadow: hasShadow,
                        skewRatio: skewRatio,
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
    required this.isBlur,
    required this.hasShadow,
    required this.skewRatio,
  });
  final bool isStroke;
  final LinearGradient gradient;
  final double radius;
  final bool isBlur;
  final bool hasShadow;
  final double skewRatio;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = CustomPaths.fullSkewPath(
      size: size,
      radius: radius,
      skewRatio: skewRatio,
    );

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
      if (!isBlur) {
        final fillPaint = Paint()
          ..shader = gradient.createShader(
            Rect.fromLTWH(0, 0, size.width, size.height),
          );
        canvas.drawPath(path, fillPaint);
      }

      if (hasShadow) {
        canvas.drawShadow(
          path,
          AppColors.shadow.withValues(alpha: .60),
          30,
          true,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BottomRightSkewPainter extends CustomPainter {
  const BottomRightSkewPainter({
    this.isStroke = false,
    required this.radius,
    required this.isBlur,
    required this.hasShadow,
    required this.skewRatio,
  });
  final bool isStroke;
  final double radius;
  final bool isBlur;
  final bool hasShadow;
  final double skewRatio;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = CustomPaths.bottomRightKewPath(
      size: size,
      radius: radius,
      skewRatio: skewRatio,
    );

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
      if (!isBlur) {
        final fillPaint = Paint()
          ..shader = AppTheme.greyBlueGradient
              .withOpacity(0.6)
              .createShader(Rect.fromLTWH(0, 0, size.width, size.height));
        canvas.drawPath(path, fillPaint);
      }

      if (hasShadow) {
        canvas.drawShadow(
          path,
          AppColors.shadow.withValues(alpha: .60),
          60,
          true,
        );
      }
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
    required this.skewRatio,
  });

  final bool isBottomRightSkew;
  final double radius;
  final double skewRatio;

  @override
  Path getClip(Size size) {
    if (isBottomRightSkew) {
      return CustomPaths.bottomRightKewPath(
        size: size,
        radius: radius,
        skewRatio: skewRatio,
      );
    } else {
      return CustomPaths.fullSkewPath(
        size: size,
        radius: radius,
        skewRatio: skewRatio,
      );
    }
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class CustomPaths {
  static Path bottomRightKewPath({
    required Size size,
    required double radius,
    required double skewRatio,
  }) {
    // final radius = 20.0;
    final path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, radius)
      ..lineTo(size.width, size.height * skewRatio - radius)
      ..quadraticBezierTo(
        size.width,
        size.height * skewRatio,
        size.width - radius,
        size.height * skewRatio,
      )
      ..lineTo(radius, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - radius)
      ..lineTo(0, radius)
      ..quadraticBezierTo(0, 0, radius, 0)
      ..close();
    return path;
  }

  static Path fullSkewPath({
    required Size size,
    required double radius,
    required double skewRatio,
  }) {
    // final radius = 10.0;
    // size.height * 0.85,

    final path = Path()
      ..moveTo(radius, size.height)
      ..lineTo(size.width - radius + (radius / 2), size.height * skewRatio)
      ..quadraticBezierTo(
        size.width,
        size.height * skewRatio,
        size.width,
        size.height * skewRatio - radius,
      )
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(radius - (radius / 2), size.height * (1 - skewRatio))
      ..quadraticBezierTo(
        0,
        size.height * (1 - skewRatio),
        0,
        size.height * (1 - skewRatio) + radius,
      )
      ..lineTo(0, size.height - radius)
      ..quadraticBezierTo(0, size.height, radius, size.height)
      ..close();
    return path;
  }
}
