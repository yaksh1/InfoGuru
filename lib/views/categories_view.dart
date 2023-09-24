// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoguru/common/widgets/duo_color_text.dart';
import 'package:infoguru/helper/news.dart';
import 'package:infoguru/models/article_model.dart';
import 'package:infoguru/views/article_view.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.category});
  final String category;
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<ArticleModel> articlesList = List<ArticleModel>.empty();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  //! function for getting news
  getCategoryNews() async {
    CategoryNews newsObj = CategoryNews();
    await newsObj.getCategoryNews(widget.category);
    articlesList = newsObj.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: DuoColorText(
              text1: "Your",
              text2: "News",
              textColor1: Colors.black,
              textColor2: Colors.indigo.shade200,
            size1: 25.sp,
            size2: 25.sp,
          ),
          centerTitle: true,
          actions: [
            Opacity(
              opacity: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Icon(Icons.save),
              ),
            )
          ],
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            :  SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(16.w),
            child: Column(
              children: [
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
        ));
  }
}

class _buildBlogTile extends StatelessWidget {
  const _buildBlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url});

  final String? imageUrl, title, desc, url;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url!,
                    )));
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
