import 'package:flutter/material.dart';
import 'package:travo/models/categories.dart';
import '../pages/location_list_page.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(13)),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(category.imageUrl),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9), BlendMode.dstATop)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LocationListPage(
                    category: category,
                  )));
            },
            child: Center(
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
