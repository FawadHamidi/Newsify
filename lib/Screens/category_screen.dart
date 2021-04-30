import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsify/models/blogModel.dart';
import 'package:newsify/services/categoryBlog_data.dart';
import 'package:newsify/widgets/blog_tile.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoryView extends StatefulWidget {
  final String categoryName;

  CategoryView({this.categoryName});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<BlogModel> blogs = [];
  bool _loading = true;

  getCategoryBlogs() async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getCategoryNews(widget.categoryName);
    blogs = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryBlogs();
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
            ),
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.height),
            ),
          ),
        ],
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
