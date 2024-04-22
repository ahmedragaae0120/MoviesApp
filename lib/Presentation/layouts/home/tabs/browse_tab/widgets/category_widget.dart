import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/data/models/categories/Genres.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatelessWidget {
  Genres category;
  String imageName;
  CategoryWidget({super.key, required this.category, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15.r),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, Routes.categoryFilterRouteName,
              arguments: category);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                      image: AssetImage(
                          "${Constants.categoryImageBasePath}$imageName"),
                      fit: BoxFit.fill)),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(5.r)),
              height: double.infinity,
              width: double.infinity,
            ),
            Text(
              category.name ?? "",
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      ),
    );
  }
}
