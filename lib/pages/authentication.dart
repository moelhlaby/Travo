import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travo/constants.dart';
import '../widgets/app_button.dart';
import '../helper/no_animation_page_route.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonPadding = EdgeInsets.all(15.0);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset( '$kImagesPath/backgrounds/annie-spratt-259379-unsplash.png',
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    kBackgroundColor.withOpacity(0.1),
                    kBackgroundColor,
                  ],
                  stops: const [0.0, 0.2, 0.7],
                )),
          ),
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 2 / 3,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('$kImagesPath/logo.png'),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text('To space and back safely')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                      color: Colors.white,
                      child: Padding(
                        padding: buttonPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('$kIconsPath/google.png'),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(color: Color(0xff1d1f22)),
                            )
                          ],
                        ),
                      ),
                      onPressed:(){},

                      //     () {
                      //   Navigator.of(context).push(NoAnimationPageRoute(
                      //       builder: (context) => const Onboarding()));
                      // }

                      ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: AppButton(
                      child: const Padding(
                        padding: buttonPadding,
                        child: Text('Use email or Phone instead'),
                      ),
                      onPressed:(){},

                    //     () {
                    //   Navigator.of(context).push(NoAnimationPageRoute(
                    //       builder: (context) => const Onboarding()));
                    // }

                      ),
                ),
                const SizedBox(height: 35),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(fontSize: 18),
                        children: [
                          TextSpan(
                              text: 'Register',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //Goto to registration page
                                }),
                        ])),
              ],
            ),
          )
        ],
      ),
    );
  }
}
