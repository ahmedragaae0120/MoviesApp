import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/popular_home_tab_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/widgets/populer_widget.dart';
import 'package:movies_app/core/DI/Di.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PopularHomeTabViewModel>()..getPopular(),
      child: BlocBuilder<PopularHomeTabViewModel, PopularHomeTabStates>(
        builder: (context, state) {
          if (state is PopularHomeTabSuccessState) {
            var popular = state.categories;
            return Padding(
              padding: REdgeInsets.only(bottom: 5.sp),
              child: CarouselSlider.builder(
                  itemBuilder: (context, index, index2) => populer_widget(
                        popular: popular[index],
                      ),
                  itemCount: 3,
                  options: CarouselOptions(
                    height: 330.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeFactor: 0.5,
                  )),
            );
          }
          return SizedBox(
            height: 230.h,
            width: double.infinity,
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
    );
  }
}
