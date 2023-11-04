// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:apimodel/data/local_data.dart';
import 'package:apimodel/data/news.dart';
import 'package:apimodel/model/article_model.dart';
import 'package:apimodel/model/categoery_model.dart';
import 'package:apimodel/screen/article_view.dart';
import 'package:apimodel/screen/category_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<CategoryModel> category =[];

  List<ArticleModel> article =[];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    category = getCategories();
    getNews();

  }
  getNews()async{
    News newsClass = News();
    await newsClass.getNews();
    article = newsClass.news;
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('SPACE',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
            Text('NEWS',style: TextStyle(fontSize:30 ,fontWeight: FontWeight.bold,color: Colors.red),)
          ],
        ),
      ),
      body: loading
          ? Center(
        child: CircularProgressIndicator(),)
          : Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  height: 130,
                  child: ListView.builder(
                      itemCount: category.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return CatogeryTile(
                          categoryTitle: category[index].categoeryName,
                          imageUrl: category[index].imageUrl,
                        );
                      }),
                ),
               Container(
                 padding: EdgeInsets.only(top: 10.0),
                 child: ListView.builder(
                     itemCount: article.length,
                     shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context , index) {
                       return ArticleTile(
                         imageUrl: article[index].urlToImage,
                         articleTitle: article[index].title,
                         description: article[index].description,
                         url: article[index].url,
                       );
                     }),
               ),
              ],
            ),
        ),
        ),

    );
  }
}

//Catogery

class CatogeryTile extends StatelessWidget {
  const CatogeryTile({super.key, this.categoryTitle, this.imageUrl});
  final String? categoryTitle ,imageUrl ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(
          category: categoryTitle!.toLowerCase(),
        )));
      },
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl:imageUrl!,fit: BoxFit.cover,width: 160,height: 120,),
            ),
            Container(
              height: 120,width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26
              ),
              child: Center(
                child: Text(categoryTitle!,style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//article

class ArticleTile extends StatelessWidget {
   ArticleTile({super.key,
  this.imageUrl,this.articleTitle,
    this.description,this.url
  });

  String? imageUrl, articleTitle,description,url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(
          blogurl: url,
        )));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl!
               ),
            ),
            Text(articleTitle!,
              style:TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black87
              ) ,),
            Text(description!,
              style:TextStyle(color: Colors.grey) ,)
          ],
        )
      ),
    );
  }
}

