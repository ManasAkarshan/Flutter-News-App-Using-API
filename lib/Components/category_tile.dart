import 'package:flutter/material.dart';
import 'package:newz/views/category_news.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.imageUrl, required this.categoryName, super.key});

  final imageUrl;
  final categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(categoryName.toString().toLowerCase());
        Navigator.push(context, MaterialPageRoute(builder: (ctx){
          return CategoryNews(category: categoryName.toString().toLowerCase());
        }));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl, width: 120, height: 60, fit: BoxFit.cover,)
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Text(categoryName, style: const TextStyle(color: Colors.white, fontSize: 17))
            )
          ],
        ),
      ),
    );
  }
}