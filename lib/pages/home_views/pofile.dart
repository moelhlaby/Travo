
import 'package:flutter/material.dart';
import 'package:travo/constants.dart';
import 'package:travo/widgets/location_card.dart';
import '../../models/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User.getCurrentUser();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Profile',
            style: TextStyle(
                fontSize: 40, fontFamily: 'SFProDisplay', color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.sort,
                size: 30,
                color: Colors.white,
              )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                'assets/images/profile_pics.png',
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Text(
                        'Info about you',
                        style:
                        TextStyle(color: kNoteTextColorDarker, height: 1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: kDefaultPadding),
                      child: Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundImage: AssetImage(
                                'assets/images/profile_pics.png',
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                right: 10,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                user.fullName,
                textAlign: TextAlign.center,
                style: kHeadingStyle.copyWith(
                  fontSize: 36,
                ),
              ),
              Text(
                user.description,
                style: const TextStyle(color: kNoteTextColorDarker),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: _contactDisplay(context),
              ),
              Padding(padding:  const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child:_visitedLocations(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: _buildCounterInfoDisplay(),
              ),
              //account for bottom navbar height
              const SizedBox(
                height: 55,
              )

            ],
          ),
        ),
      ),
    );
  }

  _contactDisplay(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _contactButton(Colors.blue, Icons.facebook, () {}),
        _contactButton(Colors.green, Icons.email, () {}),
        _contactButton(Theme
            .of(context)
            .primaryColor, Icons.phone, () {}),
      ],
    );
  }

  _contactButton(Color color, IconData icon, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon),
        ),
      ),
    );
  }

  _visitedLocations(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Row(
        children: User.getCurrentUser().visitedLocations!.map((location) =>
        Container(
          width: 180,
          height: 180,
          margin: const EdgeInsets.only(right: 20),
          child: LocationCard(
            location: location,
            onTap: () {}, offset: 0,
          ),
        )
      ,
    ).toList() ,));
  }

  _buildCounterInfoDisplay() {
    const dividerLine = Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: VerticalDivider(
        color: kNoteTextColor,
        thickness: 1,
      ),
    );
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: kGreyBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _counterItem('Trips', 10),
              dividerLine,
              _counterItem('Likes', 190),
              dividerLine,
              _counterItem('Photos', 250),
            ],
          ),
        ),
      ),
    );
  }

  _counterItem(String title, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: kNoteTextColorDarker,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          count.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ],
    );
  }
}
