import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            painter: ScaffoldPainter(),
            size: Size(double.infinity, double.infinity),
          ),
          body,
        ],
      ),
    );
  }
}

class ScaffoldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      colors: [Color(0xFF37B6E9), Color(0xFF4B4CED)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    double width = size.width;
    double height = size.height;
    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    final path = Path()
      ..moveTo(0, height * 0.95)
      ..lineTo(width * 0.8, height * 0.2)
      ..lineTo(width, height * 0.28)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// class ScaffoldPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double width = size.width;
//     double height = size.height;
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;
//
//     final path = Path()
//       ..moveTo(0, height * 0.95)
//       ..lineTo(size.width, 0)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height)
//       ..close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
