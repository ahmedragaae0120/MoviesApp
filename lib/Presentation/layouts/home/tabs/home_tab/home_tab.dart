import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/Recomended_widget.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/popular_widget_builder.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/releases_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const PopularWidget(),
          SizedBox(
            height: 25.h,
          ),
          const ReleasesWidget(),
          SizedBox(
            height: 25.h,
          ),
          const RecommendWidget(),
        ],
      ),
    );
  }
}
