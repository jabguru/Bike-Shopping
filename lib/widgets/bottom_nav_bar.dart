import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 103.5,
      width: double.infinity,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, 103.5),
            painter: BottomNavBarPainter(),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillGradient = LinearGradient(
      colors: [
        Color(0xFF363E51).withValues(alpha: .4),
        Color(0xFF181C24).withValues(alpha: .4),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final fillPaint = Paint()
      ..shader = fillGradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      )
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3);

    // final strokeGradient = LinearGradient(
    //   colors: [
    //     Color(0xFFFFFFFF).withValues(alpha: .2),
    //     Color(0xFF000000).withValues(alpha: 0.0),
    //   ],
    //   begin: Alignment.centerLeft,
    //   end: Alignment.centerRight,
    // );

    // final strokePaint = Paint()
    //   ..shader = strokeGradient.createShader(
    //     Rect.fromLTWH(0, 0, size.width, size.height),
    //   )
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2.0;

    final path = Path()
      ..moveTo(0, size.height * 0.30)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // final inset = strokePaint.strokeWidth / 2;
    //
    // final strokePath = Path()
    //   ..moveTo(inset, 20 + inset)
    //   ..lineTo(size.width - inset, inset)
    //   ..lineTo(size.width - inset, size.height - inset)
    //   ..lineTo(inset, size.height - inset)
    //   ..close();

    canvas.drawPath(path, fillPaint);
    // canvas.drawPath(strokePath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
