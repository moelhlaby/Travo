import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:travo/constants.dart';
import 'package:travo/pages/onboarding_screens/profile_view.dart';
import 'package:travo/widgets/onboarding_wrapper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

const List<Widget> onboarding_screens = [
  ProfileView(),
  OnboardingWrapper(
    background: 'vr-curve.png',
    iconName: 'colored_vr_icon.png',
    iconBackgroundName: 'vr-icon-bg.png',
    titleLine1: 'Discover Places in',
    titleLine2: 'Virtual Reality',
    messege: 'Visit many worlds and universes from '
        'your couch using your VR headset. '
        'Experience the real stuff.', iconBackgroundOffset: 0,
  ),
  OnboardingWrapper(
    background: 'vr-glasses.png',
    iconName: 'colored_vr_icon.png',
    iconBackgroundName: 'vr-icon-bg.png',
    titleLine1: 'Discover Places in',
    titleLine2: 'Virtual Reality',
    messege: 'Visit many worlds and universes from '
        'your couch using your VR headset. '
        'Experience the real stuff.',
      iconBackgroundOffset:0 ),
  OnboardingWrapper(
    background: 'solar.png',
    iconName: 'red_rocket.png',
    iconBackgroundName: 'rocket.png',
    iconBackgroundOffset: -38,
    titleLine1: 'Discover Places in',
    titleLine2: 'Virtual Reality',
    messege: 'Travel to outworld universes from our '
        'galaxy and beyound. See new places '
        'and feel the adventure.',
  ),
  OnboardingWrapper(
    background: 'building.png',
    iconName: 'navigation_icon.png',
    iconBackgroundName: 'location-pin.png',
    iconBackgroundOffset: 0,
    titleLine1: 'Search and Compare',
    titleLine2: 'Vacation Rentals',
    messege: 'Plan on staying longer? Book hotels, '
        'car rentals and other amazing deals '
        'across the universe.',
  )
];



class _OnboardingScreenState extends State<OnboardingScreen> {
  double index=0;
  void nextButton(){
    setState(() {
      index<onboarding_screens.length?index++:(){};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: onboarding_screens[index.toInt()],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: TextButton(
                child:const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffafb6c1),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  DotsIndicator(
                    position: index,
                    dotsCount: onboarding_screens.length,
                    decorator: const DotsDecorator(
                      activeColor: kPrimaryColor,
                    ),
                  ),
                  TextButton(
                    child:const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffafb6c1),
                      ),
                    ),
                    onPressed: () =>nextButton(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
