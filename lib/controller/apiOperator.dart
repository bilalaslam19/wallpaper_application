import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/model/photosModel.dart';
import 'package:wallpaper_app/model/CategoryModel.dart';

class ApiOperator {
  static List<PhotoModel> trendingWallpaper = [];
  static List<PhotoModel> searchWallpaperList = [];
  static List<CategoryModel> categoryModelList = [];

  static Future<List<PhotoModel>> getTrendingWallpaper(int page) async {
    await http.get(
      Uri.parse('https://api.pexels.com/v1/curated?per_page=40&page=1'),
      headers: {'Authorization': '4vKznjTfZ6reyKQNrgMbqazVumyqibx6jcF1sZzR57ZGxM0zKSwbXwmb'},
    ).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List<dynamic> photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpaper.add(PhotoModel.fromAPI2App(element));
      });
    });
    return trendingWallpaper;
  }

  static Future<List<PhotoModel>> searchWallpaper(String query) async {
    await http.get(
      Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=40&page=1'),
      headers: {'Authorization': '4vKznjTfZ6reyKQNrgMbqazVumyqibx6jcF1sZzR57ZGxM0zKSwbXwmb'},
    ).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List<dynamic> photos = jsonData['photos'];
      searchWallpaperList.clear();
      photos.forEach((element) {
        searchWallpaperList.add(PhotoModel.fromAPI2App(element));
      });
    });
    return searchWallpaperList;
  }

  static List<CategoryModel> getCategoriesList() {
    List cateogryName = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers"
    ];
    categoryModelList.clear();
    cateogryName.forEach((catName) async {
      final _random = new Random();

      PhotoModel photoModel =
      (await searchWallpaper(catName))[0 + _random.nextInt(11 - 0)];

      print(photoModel.imgSrc);
      categoryModelList
          .add(CategoryModel(catImgUrl: photoModel.imgSrc, catName: catName));
    });

    return categoryModelList;
  }
}
