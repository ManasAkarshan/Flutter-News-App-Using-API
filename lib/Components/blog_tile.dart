import 'package:flutter/material.dart';
import 'package:newz/views/article_view.dart';

class BlogTile extends StatelessWidget {
  const BlogTile({required this.title, required this.desc, required this.imageUrl, super.key, required this.ulr});

  final String imageUrl, title, desc, ulr;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (ctx){
          return ArticleView(blogUrl: ulr,);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Theme.of(context).colorScheme.primary,
        ),
        margin: const EdgeInsets.only(bottom: 30),
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl)
            ),
            const SizedBox(height: 7,),
            Text(
              title,
              style: const  TextStyle(
                fontSize: 17, 
                color: Colors.white,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              desc,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500
              )
            )
          ],
        ),
      ),
    );
  }
}