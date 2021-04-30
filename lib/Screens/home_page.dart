import 'package:flutter/material.dart';
import 'package:newsify/models/blogModel.dart';
import 'file:///F:/applications_projects/newsify/lib/services/category_data.dart';
import 'package:newsify/models/category_model.dart';
import 'package:newsify/services/blog_data.dart';
import 'package:newsify/services/categoryBlog_data.dart';
import 'package:newsify/widgets/blog_tile.dart';
import 'package:newsify/widgets/category_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> categories = [];
  List<BlogModel> blogs = [];
  List<CategoriesModel> categoryBlogs = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getBlogs();
  }

  getBlogs() async {
    News newsClass = News();
    await newsClass.getNews();
    blogs = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('New'),
            Text(
              'sify',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 80,
                      child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imgUrl: categories[index].imgUrl,
                            cateoryName: categories[index].name,
                            blogUrl: blogs[index].blogUrl,
                          );
                        },
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: blogs.length,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: blogs[index].imageurl,
                            title: blogs[index].title,
                            desc: blogs[index].desc,
                            blogUrl: blogs[index].blogUrl,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
