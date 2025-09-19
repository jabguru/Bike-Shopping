import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/widgets/custom_container.dart';
import 'package:flutter/material.dart';

enum NavBarItem { home, map, cart, profile, doc }

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 103.5,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(
            size: Size(double.infinity, 103.5),
            painter: BottomNavBarPainter(),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavIcon(
                icon: Assets.images.navBarIcons.bicycle,
                value: NavBarItem.home,
              ),
              NavIcon(
                icon: Assets.images.navBarIcons.map,
                value: NavBarItem.map,
              ),
              NavIcon(
                icon: Assets.images.navBarIcons.cart,
                value: NavBarItem.cart,
              ),
              NavIcon(
                icon: Assets.images.navBarIcons.person,
                value: NavBarItem.profile,
              ),
              NavIcon(
                icon: Assets.images.navBarIcons.doc,
                value: NavBarItem.doc,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({required this.icon, required this.value, super.key});
  final SvgGenImage icon;
  final NavBarItem value;

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == NavBarItem.home;
    return isSelected
        ? CustomContainer()
        : icon.svg(
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.white : Colors.white.withValues(alpha: 0.6),
              BlendMode.srcIn,
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
