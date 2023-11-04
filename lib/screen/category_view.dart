import 'package:apimodel/data/news.dart';
import 'package:apimodel/model/article_model.dart';
import 'package:apimodel/screen/home.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
   CategoryScreen({super.key,required this.category});
  String? category;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  
  List<ArticleModel>article =[];
  bool loading = true;
  
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }
 getCategoryNews()async{
   CategoriesNewsClass NewsClass =CategoriesNewsClass();
  await NewsClass.getNews(widget.category!);
    article = NewsClass.news;
    setState(() {
      loading = false;
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
          :  SingleChildScrollView(
            child: Container(
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
          ),
    );
  }

}
