import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/screen/search.dart';

class SearchBAr extends StatelessWidget {
  //String query;

  SearchBAr({super.key,
 // required this.query
  });
 final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(25),
        color: Colors.black12,
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(query: _searchController.text)));
              },
              child: const Icon(Icons.search)),
          hintText: "Search Wallpaper",
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,

        ),
      ),
    );
  }
}
