// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, unused_element, prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoguru/common/widgets/duo_color_text.dart';
import 'package:infoguru/helper/data.dart';
import 'package:infoguru/helper/news.dart';
import 'package:infoguru/models/article_model.dart';
import 'package:infoguru/models/category_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:infoguru/views/article_view.dart';
import 'package:infoguru/views/categories_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = List<CategoryModel>.empty();
  List<ArticleModel> articlesList = List<ArticleModel>.empty();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categoriesList = getCategories();
    getNewsFromApi();
  }

  //! function for getting news
  getNewsFromApi() async {
    News newsObj = News();
    await newsObj.getNews();
    articlesList = newsObj.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DuoColorText(
          text1: 'Info',
          text2: 'Guru',
          textColor1: Colors.black,
          textColor2: Colors.indigo.shade200,
          size1: 25.sp,
          size2: 25.sp,
        ),
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    //! categories
                    Container(
                      height: 85.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: categoriesList.length,
                          itemBuilder: (context, index) {
                            return _buildCardTile(
                              categoryName: categoriesList[index].categoryName,
                              imageUrl: categoriesList[index].imageUrl,
                            );
                          }),
                    ),

                    //! articles
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25.h),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: articlesList.length,
                          itemBuilder: (context, index) {
                            return _buildBlogTile(
                                imageUrl: articlesList[index].urlToImage,
                                title: articlesList[index].title,
                                url: articlesList[index].url,
                                desc: articlesList[index].desc,
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

class _buildCardTile extends StatelessWidget {
  const _buildCardTile({super.key,required this.imageUrl, required this.categoryName});

  final String imageUrl;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categories(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.w),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 145.w,
                  height: 85.h,
                  fit: BoxFit.cover),
            ),
            Container(
              width: 145.w,
              height: 85.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: Colors.black26),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _buildBlogTile extends StatelessWidget {
  const _buildBlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc, required this.url});

  final String? imageUrl, title, desc,url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url!,)));
      },
      child: Container(
          padding: EdgeInsets.all(17.w),
          margin: EdgeInsets.only(bottom: 17.w),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(20.r)),
          // padding: EdgeInsets.only(bottom: 20.h),
          child: Wrap(
            runSpacing: 5,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.network(imageUrl!, fit: BoxFit.cover),
              ),
              Text(
                title!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
              ),
              Text(
                desc!,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 13.sp),
              ),
            ],
          )),
    );
  }
}
