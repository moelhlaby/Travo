
import 'package:flutter/material.dart';
import 'package:travo/constants.dart';
import 'package:travo/models/categories.dart';
import 'package:travo/models/location.dart';
import '../pages/location_list.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key, required this.category});

  final Category category;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late List<Location> _locations;
  @override
  void initState() {
    super.initState();
    _locations = Location.getLocations();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            widget.category.name,
          style: kHeadingStyle.copyWith(color: Colors.white),
        ),
      ),
      body: LocationList(locations:_locations,),
    );
  }
}
