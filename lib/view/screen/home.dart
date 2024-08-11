import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiOperator.dart';
import 'package:wallpaper_app/model/photosModel.dart';
import 'package:wallpaper_app/model/CategoryModel.dart';
import 'package:wallpaper_app/view/screen/fullScreen.dart';
import 'package:wallpaper_app/view/widget/CustomAppBar.dart';
import 'package:wallpaper_app/view/widget/SearchBar.dart';
import 'package:wallpaper_app/view/widget/catBlock.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoModel> trendingWallList = [];
 late List<CategoryModel> catModelList;
  bool isLoading = true;
  int p=1;

   getCatDetail() async {
    catModelList = await ApiOperator.getCategoriesList();
    setState(() {
     catModelList = catModelList;
       isLoading = false;
    });

  }

  getTrendingWallpaper(int page) async {
    trendingWallList = await ApiOperator.getTrendingWallpaper(page);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCatDetail();
    getTrendingWallpaper(p);
    isLoading = true;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white38,
        centerTitle: true,
        title: const CustomAppBar(),
      ),
      body: isLoading ? const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:   SearchBAr(),
            ),
          const  SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catModelList.length,

                  itemBuilder: ((context, index) =>  CatBlock(categoryImgSrc:catModelList[index].catImgUrl, categoryName: catModelList[index].catName)),
                ),
              ),
            ),
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
                itemCount: (trendingWallList.length),
                itemBuilder: (context, index) =>  GridTile(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreen(imgUrl: trendingWallList[index].imgSrc)));
                      },
                      child: Hero(
                        tag:trendingWallList[index].imgSrc ,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(

                              trendingWallList[index].imgSrc,
                              height: 1200,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
