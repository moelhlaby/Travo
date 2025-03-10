import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travo/constants.dart';
import 'package:travo/models/categories.dart';
import 'package:travo/widgets/categories_card.dart';
import 'package:travo/widgets/slider_location_card.dart';
import '../models/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding:  EdgeInsets.only(left: 10.0),
          child: Text(
            'Discover',
            style: TextStyle(fontSize: 40, fontFamily: 'SFProDisplay',color: Colors.white),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CircleAvatar(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      'Trending locations today',
                      style: TextStyle(color: kNoteTextColorDarker, height: 1),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: _buildImageSlider()),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                'Feeling Adventurous?',
                style: kHeadingStyle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: 20),
              child: Text(
                'Get Inspiration from these trending categories',
                style: TextStyle(
                  color: kNoteTextColor,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: _buildCategoriesGrid(),
            )
          ],
        ),
      )),
    );
  }

  _buildImageSlider(){
    final height = MediaQuery.of(context).size.height;
    List<Location> sliderLocations = Location.getLocations().take(4).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: CarouselSlider(
        options: CarouselOptions(
            autoPlay: false,
            aspectRatio: height<700?1.6:1.1,
            enableInfiniteScroll: false,
            viewportFraction: (MediaQuery.of(context).size.width - 3 * kDefaultPadding) /
                MediaQuery.of(context).size.width,
            disableCenter: true,
            enlargeCenterPage: true),
        items: sliderLocations
            .map((location) => SliderLocationCard(
          offset: 0,
          onTap: () {},
          location: location,
        ))
            .toList(),
      ),
    );
  }

  _buildCategoriesGrid() {
    const categriesPath = '$kImagesPath/categories';
    List<Category> categories = [
      Category(name: 'Nature', imageUrl: '$categriesPath/nature.png'),
      Category(name: 'Futuristic', imageUrl: '$categriesPath/futuristic.png'),
      Category(name: 'Party', imageUrl: '$categriesPath/party.png'),
      Category(name: 'Green', imageUrl: '$categriesPath/green.png'),
    ];

    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.8),
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoriesCard(category: categories[index]));
  }
}
