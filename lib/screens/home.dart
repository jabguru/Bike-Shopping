import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/theme/colors.dart';
import 'package:bike_shopping/widgets/bottom_nav_bar.dart';
import 'package:bike_shopping/widgets/button.dart';
import 'package:bike_shopping/widgets/custom_container.dart';
import 'package:bike_shopping/widgets/custom_scaffold.dart';
import 'package:bike_shopping/widgets/space.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SafeArea(
                    bottom: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Choose Your Bike",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        Button(child: Assets.images.search.svg()),
                      ],
                    ),
                  ),
                  VerticalSpacing(24.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomContainer(
                            width: double.infinity,
                            height: 240.0,
                            isBottomRightSkew: true,
                            hasStroke: true,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                17.0,
                                30.0,
                                17.0,
                                24.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Assets.images.bike1.image(
                                      height: 153.0,
                                    ),
                                  ),
                                  Text(
                                    "30% Off",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomNavBar(),
        ],
      ),
    );
  }
}
