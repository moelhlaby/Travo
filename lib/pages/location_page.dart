import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:travo/constants.dart';
import 'package:travo/models/location.dart';
import 'package:travo/widgets/app_button.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key, required this.location});
  final Location location;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Hero(
          tag: 'location_image' + location.title,
          child: Image.asset(
            location.imageUrl,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        )),
        Positioned(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              kBackgroundColor.withOpacity(0.4),
              kBackgroundColor.withOpacity(0.7),
            ],
            stops: const [0.0, 0.5],
          )),
        )),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              location.place.toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 600),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 190.0,
                    child: FadeInAnimation(
                      child: widget,
                      duration: const Duration(milliseconds: 600),
                    ),
                  ),
                  children: [
                    Text(
                      location.title,
                      style: kHeadingStyle.copyWith(
                          fontSize: 42, color: Colors.white),
                    ),
                    _buildWeatherDisplay(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding + 5,
                      ),
                      child: Text(
                        '${location.description}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 21, height: 1.5, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSecondaryInfo('colored_vr_icon', 'VR TOUR'),
                          SizedBox(
                              height: 36,
                              child: VerticalDivider(
                                  thickness: 2,
                                  color: Colors.white.withOpacity(0.5),
                                  width: 55)),
                          _buildSecondaryInfo('gallery', 'GALLERY'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: AppButton(
                        onPressed: () {},
                        color: kPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                '$kIconsPath/rocket.png',
                                fit: BoxFit.cover,
                                height: 28,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('SCHEDULE TRIP',style: TextStyle(color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryInfo(String icon, String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('$kIconsPath/$icon.png'),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  _buildWeatherDisplay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('$kIconsPath/weather.png'),
          const SizedBox(
            width: 20,
          ),
          const Column(
            children: [
              Text(
                'WEATHER NOW',
                style: TextStyle(
                  fontSize: 15,
                  color: kNoteTextColor,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '32°C - Light Rain',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
