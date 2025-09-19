import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, this.width = 60, this.height = 60.0});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: ContainerPainter(), size: Size(width, height));
  }
}

class ContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillGradient = LinearGradient(
      colors: [Color(0xFF34C8E8), Color(0xFF4E4AF2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final fillPaint = Paint()
      ..shader = fillGradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

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

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
