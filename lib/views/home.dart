// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, unused_element, prefer_typing_uninitialized_variables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infoguru/common/widgets/duo_color_text.dart';
import 'package:infoguru/helper/data.dart';
import 'package:infoguru/models/category_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = List<CategoryModel>.empty();

  @override
  void initState() {
    super.initState();
    categoriesList = getCategories();
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
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
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
          ],
        ),
      ),
    );
  }
}

class _buildCardTile extends StatelessWidget {
  const _buildCardTile({super.key, this.imageUrl, this.categoryName});

  final imageUrl;
  final categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //TODO: tap function
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.w),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                imageUrl,
                width: 145.w,
                height: 85.h,
                fit:BoxFit.cover
              ),
            ),
            Container(
              width: 145.w,
              height: 85.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Colors.black26
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
              ),),
            )
          ],
        ),
      ),
    );
  }
}

