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
                  HorizontalSpacing(24.0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomContainer(
                            child: SizedBox(),
                            width: 350 / 0,
                            height: 240.0,
                            isBottomRightSkew: true,
                            hasStroke: true,
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
