import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_tab/view_model/search_view_model.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/search_tab/widgets/search_movie_widget.dart';
import 'package:movies_app/domain/entities/SearchEntitie.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SizedBox(
            height: 50.h,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
                SearchTabViewModel.getObject(context).search(movieName: value);
              },
              cursorWidth: 1,
              cursorHeight: 22,
              style: Theme.of(context).textTheme.headlineLarge,
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
                filled: true,
                suffixIconColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "search",
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white60),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.r),
                  borderSide: const BorderSide(color: Colors.white54, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.r),
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                ),
              ),
            ),
          ),
        ),
        searchValue == ""
            ? Expanded(
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
              )
            : BlocBuilder<SearchTabViewModel, SearchTabStates>(
                builder: (context, state) {
                  if (state is SearchTabSuccessState) {
                    List<SearchEntitie> result = state.searchResult;
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              SearchMovieWidget(movie: result[index]),
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
                          itemCount: result.length),
                    );
                  }
                  if (state is SearchTabErrorState) {
                    return Expanded(
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
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
