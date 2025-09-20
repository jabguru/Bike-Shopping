import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/theme/colors.dart';
import 'package:bike_shopping/theme/theme.dart';
import 'package:bike_shopping/widgets/button.dart';
import 'package:bike_shopping/widgets/space.dart';
import 'package:flutter/material.dart';

enum Category { all, electric, road, mountain, accessory }

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Category _selected = Category.all;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 99.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -14.0,
            width: MediaQuery.sizeOf(context).width - 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: Category.values
                  .map(
                    (category) => CategoryIcon(
                      category: category,
                      selected: _selected,
                      onTap: () => setState(() {
                        _selected = category;
                      }),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    required this.category,
    required this.selected,
    required this.onTap,
    super.key,
  });
  final Category category;
  final Category selected;
  final VoidCallback onTap;

  bool get isSelected => selected == category;
  Color get childColor =>
      AppColors.white.withValues(alpha: isSelected ? 1.0 : 0.6);

  Widget get child {
    switch (category) {
      case Category.all:
        return Text(
          "All",
          style: TextStyle(
            fontSize: 13.0,
            color: childColor,
            fontWeight: FontWeight.w500,
          ),
        );
      case Category.electric:
        return Assets.images.icons.electric.svg(
          colorFilter: ColorFilter.mode(childColor, BlendMode.srcIn),
        );
      case Category.road:
        return Assets.images.icons.road.svg(
          colorFilter: ColorFilter.mode(childColor, BlendMode.srcIn),
        );
      case Category.mountain:
        return Assets.images.icons.mountain.svg(
          colorFilter: ColorFilter.mode(childColor, BlendMode.srcIn),
        );
      case Category.accessory:
        return Assets.images.icons.accessory.svg(
          colorFilter: ColorFilter.mode(childColor, BlendMode.srcIn),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Button(
          width: 50.0,
          height: 50.0,
          onTap: onTap,
          backgroundGradient: isSelected
              ? AppTheme.linearGradient
              : AppTheme.greyBlueGradient,
          strokeBlendMode: isSelected ? BlendMode.overlay : BlendMode.srcOver,
          strokeOpacity: isSelected ? 0.6 : 0.2,
          child: Center(child: child),
        ),
        VerticalSpacing(Category.values.indexOf(category) * 10),
      ],
    );
  }
}
