import 'package:flutter/material.dart';
import 'package:newz/Components/blog_tile.dart';
import 'package:newz/Components/category_tile.dart';
import 'package:newz/helper/data.dart';
import 'package:newz/models/article_model.dart';
import 'package:newz/models/category_model.dart';

import '../helper/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    categories = getCategories(); // data.dart file
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
          children: [
            Text('New'),
            Text(
              'Z',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: _loading
          ? Container(
              child: const Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
            child: Container(
              color: Theme.of(context).colorScheme.background,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    //Categories
                    Container(
                      height: 70, //IMPORTANT
                      // padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName);
                          }),
                    ),
                    SizedBox(height: 10,),
                    //Blogs
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: ((context, index) {
                          return BlogTile(
                              title: articles[index].title,
                              desc: articles[index].description,
                              imageUrl: articles[index].urlToImage,
                              ulr: articles[index].url,);
                        }),
                      ),
                    )
                  ],
                ),
              ),
          ),
    );
  }
}
