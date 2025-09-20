import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/theme/theme.dart';
import 'package:bike_shopping/widgets/custom_container.dart';
import 'package:flutter/material.dart';

enum NavBarItem { home, map, cart, profile, doc }

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  NavBarItem _selectedItem = NavBarItem.home;
  NavBarItem _previousItem = NavBarItem.home;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );
    _animationController.value = 1.0;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(NavBarItem item) {
    if (_selectedItem != item) {
      setState(() {
        _previousItem = _selectedItem;
        _selectedItem = item;
      });
      _animationController.reset();
      _animationController.forward();
    }
  }

  double _getItemPosition(NavBarItem item, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = 60.0;
    final availableWidth = screenWidth - 48 - containerWidth;
    final iconSpacing = availableWidth / 4;
    final iconIndex = item.index;
    return iconIndex * iconSpacing;
  }

  double _getCurrentPosition(BuildContext context) {
    final previousPos = _getItemPosition(_previousItem, context);
    final currentPos = _getItemPosition(_selectedItem, context);
    return previousPos + (currentPos - previousPos) * _slideAnimation.value;
  }

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
          AnimatedBuilder(
            animation: _slideAnimation,
            builder: (context, child) {
              return Positioned(
                left: 24 + _getCurrentPosition(context),
                bottom: 32,
                child: CustomContainer(
                  hasStroke: true,
                  isCentered: true,
                  radius: 10.0,
                  gradient: AppTheme.linearGradient,
                  child: _getSelectedIcon().svg(
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: NavBarItem.values
                  .map(
                    (item) => NavIcon(
                      value: item,
                      selected: _selectedItem,
                      onTap: () => _onItemTapped(item),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  SvgGenImage _getSelectedIcon() {
    switch (_selectedItem) {
      case NavBarItem.home:
        return Assets.images.navBarIcons.bicycle;
      case NavBarItem.map:
        return Assets.images.navBarIcons.map;
      case NavBarItem.cart:
        return Assets.images.navBarIcons.cart;
      case NavBarItem.profile:
        return Assets.images.navBarIcons.person;
      case NavBarItem.doc:
        return Assets.images.navBarIcons.doc;
    }
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({
    required this.value,
    required this.selected,
    required this.onTap,
    super.key,
  });
  final NavBarItem value;
  final NavBarItem selected;
  final VoidCallback onTap;

  SvgGenImage get icon {
    switch (value) {
      case NavBarItem.home:
        return Assets.images.navBarIcons.bicycle;
      case NavBarItem.map:
        return Assets.images.navBarIcons.map;
      case NavBarItem.cart:
        return Assets.images.navBarIcons.cart;
      case NavBarItem.profile:
        return Assets.images.navBarIcons.person;
      case NavBarItem.doc:
        return Assets.images.navBarIcons.doc;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == value;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isSelected ? 0.0 : 0.6,
          child: icon.svg(
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.6),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillGradient = LinearGradient(
      colors: [Color(0xFF363E51), Color(0xFF181C24)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final fillPaint = Paint()
      ..shader = fillGradient
          .withOpacity(0.4)
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
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
