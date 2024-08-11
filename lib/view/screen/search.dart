import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiOperator.dart';
import 'package:wallpaper_app/model/photosModel.dart';
import 'package:wallpaper_app/view/screen/fullScreen.dart';
import 'package:wallpaper_app/view/widget/CustomAppBar.dart';
import 'package:wallpaper_app/view/widget/SearchBar.dart';



class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key,
  required this.query});

  @override
  State<SearchScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SearchScreen> {
  List<PhotoModel>? searchResult;
  bool isLoading = true;
  getSearchResult()async{
    searchResult = await ApiOperator.searchWallpaper(widget.query);
setState(() {
isLoading = false;
});
  }

  @override
  void initState() {
    super.initState();
    getSearchResult();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const CustomAppBar(),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  SearchBAr(),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: 600,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 400,
                ),
                itemCount: searchResult?.length,
                itemBuilder: (context, index) =>  GridTile(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreen(
                            imgUrl: searchResult![index].imgSrc,
                          ),
                        ),
                      );
                    },
                  child:
                     Container(
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                            height: 500,
                            width: 50,
                            fit: BoxFit.cover,
                          searchResult![index].imgSrc)

                        ),
                      ),
                    ),
                  ),
                ),



            ),
           ]
        ),
      ),
    );
  }
}
