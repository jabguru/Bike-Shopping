import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/theme/colors.dart';
import 'package:bike_shopping/theme/theme.dart';
import 'package:bike_shopping/widgets/button.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryIcon(
            category: Category.all,
            selected: _selected,
            onTap: () => setState(() {
              _selected = Category.all;
            }),
          ),
          CategoryIcon(
            category: Category.electric,
            selected: _selected,
            onTap: () => setState(() {
              _selected = Category.electric;
            }),
          ),
          CategoryIcon(
            category: Category.road,
            selected: _selected,
            onTap: () => setState(() {
              _selected = Category.road;
            }),
          ),
          CategoryIcon(
            category: Category.mountain,
            selected: _selected,
            onTap: () => setState(() {
              _selected = Category.mountain;
            }),
          ),
          CategoryIcon(
            category: Category.accessory,
            selected: _selected,
            onTap: () => setState(() {
              _selected = Category.accessory;
            }),
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

  Widget get child {
    switch (category) {
      case Category.all:
        return Text(
          "All",
          style: TextStyle(
            fontSize: 13.0,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        );
      case Category.electric:
        return Assets.images.icons.electric.svg();
      case Category.road:
        return Assets.images.icons.road.svg();
      case Category.mountain:
        return Assets.images.icons.mountain.svg();
      case Category.accessory:
        return Assets.images.icons.accessory.svg();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Button(
      width: 50.0,
      height: 50.0,
      onTap: onTap,
      backgroundGradient: selected == category
          ? AppTheme.linearGradient
          : AppTheme.greyBlueGradient,
      child: Center(child: child),
    );
  }
}
