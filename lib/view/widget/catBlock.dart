import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screen/category.dart';

class CatBlock extends StatelessWidget {
  String categoryImgSrc;
  String categoryName;

  CatBlock({
    super.key,
    required this.categoryName,
    required this.categoryImgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
                catImgUrl: categoryImgSrc, catName: categoryName),
          ),
        );
      },
      child: Container(
        height: 50,
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                categoryImgSrc,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              left: 10,
              top: 15,
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
