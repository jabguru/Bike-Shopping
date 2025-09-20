import 'package:bike_shopping/gen/assets.gen.dart';
import 'package:bike_shopping/theme/colors.dart';
import 'package:bike_shopping/theme/theme.dart';
import 'package:bike_shopping/widgets/custom_container.dart';
import 'package:bike_shopping/widgets/space.dart';
import 'package:flutter/material.dart';

class Listing {
  final String name;
  final String type;
  final String price;
  final AssetGenImage image;
  final bool isFavorite;

  Listing({
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    this.isFavorite = false,
  });
}

List<Listing> listings = [
  Listing(
    name: "PEUGEOT - LR01",
    type: "Road Bike",
    price: "1,999.99",
    image: Assets.images.bike2,
    isFavorite: true,
  ),
  Listing(
    name: "SMITH - Trade",
    type: "Road Helmet",
    price: "120",
    image: Assets.images.helmet1,
  ),
  Listing(
    name: "SMITH - Trade",
    type: "Road Helmet",
    price: "120",
    image: Assets.images.helmet1,
    isFavorite: true,
  ),
  Listing(
    name: "PILOT - Chromoly ",
    type: "Mountain Bike",
    price: "1,999.99",
    image: Assets.images.bike3,
  ),
];

class ListingItem extends StatelessWidget {
  const ListingItem({required this.listing, required this.index, super.key});
  final Listing listing;
  final int index;

  double get _topOffset {
    if (index == 0) return 0.0;
    if (index == 1) return -32.0;
    return index % 2 == 0 ? -16.0 : -48.0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: _topOffset,
          child: CustomContainer(
            height: eqH(context, 241.0),
            width: eqW(context, 165.0),
            radius: 20.0,
            gradient: AppTheme.greyBlueGradient.withOpacity(0.6),
            hasStroke: true,
            isBlur: true,
            blurSigma: 30.0,
            skewRatio: 0.90,
            child: SizedBox(
              width: eqW(context, 165.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 24.0, 18.0, 34.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        listing.isFavorite
                            ? Assets.images.icons.heartSelected.svg()
                            : Assets.images.icons.heart.svg(),
                      ],
                    ),
                    Center(
                      child: listing.image.image(height: eqH(context, 110)),
                    ),
                    VerticalSpacing(9.0),
                    Text(listing.type),
                    Text(
                      listing.name,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("\$ ${listing.price}"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
