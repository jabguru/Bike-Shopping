import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/theme/colors.dart';
import 'package:bike_shopping/widgets/bottom_nav_bar.dart';
import 'package:bike_shopping/widgets/button.dart';
import 'package:bike_shopping/widgets/category.dart';
import 'package:bike_shopping/widgets/custom_scaffold.dart';
import 'package:bike_shopping/widgets/featured_bike.dart';
import 'package:bike_shopping/widgets/listing.dart';
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
                        Button(
                          strokeBlendMode: BlendMode.overlay,
                          strokeOpacity: 0.6,
                          child: Assets.images.search.svg(),
                        ),
                      ],
                    ),
                  ),
                  VerticalSpacing(24.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FeaturedBike(),
                        Categories(),
                        VerticalSpacing(16.0),
                        Expanded(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                top: -eqH(context, 24.0),
                                width: MediaQuery.sizeOf(context).width - 40.0,
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: listings.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent:
                                            eqH(context, 241.0) + 16,
                                        crossAxisSpacing: 20.0,
                                      ),
                                  itemBuilder: (context, index) {
                                    return ListingItem(
                                      listing: listings[index],
                                      index: index,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
