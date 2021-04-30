import 'package:flutter/material.dart';
import 'package:newsify/Screens/blog_screen.dart';
import 'package:newsify/Screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final String cateoryName, imgUrl, blogUrl;

  CategoryTile({this.cateoryName, this.imgUrl, this.blogUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryView(
              categoryName: cateoryName.toString().toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                cateoryName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
