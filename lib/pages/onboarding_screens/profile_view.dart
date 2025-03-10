import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:travo/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 120,
            backgroundImage: AssetImage(
              'assets/images/profile_pics.png',
            ),
          ),
          const SizedBox(height: 40,),
          Text(
            'Hi Tamara',
            style: kHeadingStyle.copyWith(fontSize: 35),
          ),
          RichText(text: TextSpan(
              text: 'Welcome to',
              style: kHeadingStyle.copyWith(fontSize: 35),
              children: [
                TextSpan(
                    text: '\nTravo',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor
                    )
                ),
              ]
          ),
            textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}
