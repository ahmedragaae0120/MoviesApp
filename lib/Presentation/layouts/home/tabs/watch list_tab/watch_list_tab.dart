import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_tab/view_model/search_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/watch%20list_tab/view_model/watch_list_view_model.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/movie_widget_for_search_and_watch_list.dart';
import 'package:movies_app/data/models/firebase_movie_model.dart';
import 'package:provider/provider.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context);
    return BlocProvider(
      create: (context) => getIt<WatchListTabViewModel>()
        ..getFireStoreMovie(userId: provider.fireBaseUserAuth!.uid),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 60.h)),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Watchlist",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 22),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            BlocBuilder<WatchListTabViewModel, WatchListTabStates>(
              builder: (context, state) {
                if (state is WatchListTabSuccessState) {
                  Stream<List<FireBaseMovieModel>> result =
                      state.fireBaseMovies;
                  return StreamBuilder(
                    stream: result,
                    builder: (context, snapshot) {
                      var movie = snapshot.data;
                      return SliverList.separated(
                          itemBuilder: (context, index) =>
                              MovieWidgetForSearchAndWatchList(
                                  movie: movie?[index], isSearchTab: false),
                          separatorBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Divider(
                                thickness: 1,
                                endIndent: 15.w,
                                indent: 15.w,
                              ),
                            );
                          },
                          itemCount: movie?.length ?? 0);
                    },
                  );
                }
                if (state is SearchTabErrorState) {
                  return SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/movieNotFound.png"),
                        Text(
                          "No movie found",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  );
                }
                return const SliverToBoxAdapter(
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
