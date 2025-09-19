import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/widgets/custom_container.dart';
import 'package:flutter/material.dart';

enum NavBarItem { home, map, cart, profile, doc }

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  NavBarItem _selectedItem = NavBarItem.home;

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavIcon(
                  icon: Assets.images.navBarIcons.bicycle,
                  value: NavBarItem.home,
                  selected: _selectedItem,
                  onTap: () => setState(() {
                    _selectedItem = NavBarItem.home;
                  }),
                ),
                NavIcon(
                  icon: Assets.images.navBarIcons.map,
                  value: NavBarItem.map,
                  selected: _selectedItem,
                  onTap: () => setState(() {
                    _selectedItem = NavBarItem.map;
                  }),
                ),
                NavIcon(
                  icon: Assets.images.navBarIcons.cart,
                  value: NavBarItem.cart,
                  selected: _selectedItem,
                  onTap: () => setState(() {
                    _selectedItem = NavBarItem.cart;
                  }),
                ),
                NavIcon(
                  icon: Assets.images.navBarIcons.person,
                  value: NavBarItem.profile,
                  selected: _selectedItem,
                  onTap: () => setState(() {
                    _selectedItem = NavBarItem.profile;
                  }),
                ),
                NavIcon(
                  icon: Assets.images.navBarIcons.doc,
                  value: NavBarItem.doc,
                  selected: _selectedItem,
                  onTap: () => setState(() {
                    _selectedItem = NavBarItem.doc;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({
    required this.icon,
    required this.value,
    required this.selected,
    required this.onTap,
    super.key,
  });
  final SvgGenImage icon;
  final NavBarItem value;
  final NavBarItem selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return selected == value
        ? Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: CustomContainer(
              child: icon.svg(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: icon.svg(
              colorFilter: ColorFilter.mode(
                Colors.white.withValues(alpha: 0.6),
                BlendMode.srcIn,
              ),
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

    final path = Path()
      ..moveTo(0, size.height * 0.30)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
