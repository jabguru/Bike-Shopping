import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/theme/colors.dart';
import 'package:bike_shopping/theme/theme.dart';
import 'package:bike_shopping/widgets/custom_container.dart';
import 'package:bike_shopping/widgets/space.dart';
import 'package:flutter/material.dart';

class FeaturedBike extends StatelessWidget {
  const FeaturedBike({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      gradient: AppTheme.greyBlueGradient.withOpacity(0.6),
      height: eqH(context, 240.0),
      isBottomRightSkew: true,
      hasStroke: true,
      isBlur: true,
      hasShadow: true,
      radius: 20.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17.0, 30.0, 17.0, 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Assets.images.bike1.image(height: eqH(context, 153.0)),
            ),
            Text(
              "30% Off",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.white.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
