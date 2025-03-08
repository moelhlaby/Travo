import 'package:flutter/material.dart';
import 'package:travo/constants.dart';
import 'package:travo/models/location.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, required this.offset, required this.location, required this.onTap});

  final double offset;
  final Location location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 2);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(13)),
      child: Stack(
        children: [
          Positioned(
              left: -10,
              right: 0,
              top: -10,
              bottom: 0,
              child: Hero(
                tag: 'location_image'+location.title,
                child: Image.asset
                  (
                  location.imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    kBackgroundColor.withOpacity(0.1),
                    kBackgroundColor.withOpacity(0.7),
                  ],
                  stops: const [0.0, 0.4, 0.7],
                )),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kPrimaryColor,
              ),
              child: Row(
                children: [
                  Image.asset('$kIconsPath/rocket.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(location.getFormattedPrice())
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 10,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('$kIconsPath/vr_icon.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('VR')
                            ],
                          ),
                          spacer,
                          Text(
                            location.country,
                            style: kHeadingStyle.copyWith(fontSize: 23),
                          ),
                          spacer,
                          Text(
                            location.place.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 13,
                              color: kNoteTextColorDarker,
                            ),
                          )
                        ],
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
