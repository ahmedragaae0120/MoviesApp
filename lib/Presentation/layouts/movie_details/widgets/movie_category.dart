import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/categories/Genres.dart';

class MovieCategory extends StatelessWidget {
  final Genres category;
  const MovieCategory({super.key,required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 65.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4.sp),
        border: Border.all(width: 1 , color: Theme.of(context).colorScheme.onPrimaryContainer)
      ),
      child: Center(child: SingleChildScrollView( scrollDirection: Axis.horizontal ,child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.sp),
        child: Text(category.name??"" ,style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 10.sp)),
      )
      )
      ),
    );
  }
}
