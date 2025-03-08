import 'package:flutter/material.dart';
import 'package:travo/constants.dart';

class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper(
      {super.key,
      required this.background,
      required this.titleLine1,
      required this.titleLine2,
      required this.iconName,
      required this.messege,
      required this.iconBackgroundName,required this.iconBackgroundOffset});

  final String background;
  final String titleLine1;
  final String titleLine2;
  final String iconName;
  final String iconBackgroundName;
  final double iconBackgroundOffset;
  final String messege;

  @override
  Widget build(BuildContext context) {
    double startPosition = MediaQuery.of(context).size.height - 400;
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Image.asset(
            'assets/images/backgrounds/$background',
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                0.0,
                0.3,
                0.6
              ],
                  colors: [
                Colors.transparent,
                kBackgroundColor.withOpacity(0.1),
                kBackgroundColor,
              ])),
        )),
        Positioned(
          top: startPosition,
          left: -10,
          right: -10,
          child: Image.asset(
            'assets/images/backgrounds/$iconBackgroundName',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            top: startPosition - iconBackgroundOffset + 15,
            left: kDefaultPadding * 2,
            right: kDefaultPadding * 2,
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/$iconName',
                  height: 30,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Search And Compare',
                        style: kHeadingStyle,
                        children: [
                          TextSpan(
                              text: '\nVacation Rentals',
                              style: kHeadingStyle.copyWith(
                                  color: Theme.of(context).primaryColor))
                        ])),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  messege,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: kNoteTextColor,
                    fontSize: 17,
                    height: 1.7,
                  ),
                )
              ],
            ))
      ],
    );
  }
}
