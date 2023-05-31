import 'package:flutter/material.dart';
import 'package:newz/helper/news.dart';

import '../Components/blog_tile.dart';
import '../models/article_model.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key, required this.category});

  final String category;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    getCategoryNews();
    super.initState();
  }

  getCategoryNews() async {
    CategoryNewsClass categoryNewsClass = CategoryNewsClass();
    await categoryNewsClass.getCategoryNews(widget.category);
    articles = categoryNewsClass.news;
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
              padding: EdgeInsets.only(left: 10, right: 10, top: 8),
                child: Column(
                  children: [
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
                            ulr: articles[index].url,
                          );
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
