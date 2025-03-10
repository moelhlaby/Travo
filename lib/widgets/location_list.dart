import 'package:flutter/material.dart';
import 'package:travo/constants.dart';
import 'package:travo/models/location.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:travo/widgets/location_card.dart';

class LocationList extends StatelessWidget {
  const LocationList({super.key, required this.locations});

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.91,
            children: List.generate(
                locations.length,
                (index) => LocationCard(
                    offset: 0, location: locations[index], onTap: () {}))),
      ),
    );
  }
}
