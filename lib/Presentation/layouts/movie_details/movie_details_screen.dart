import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/poster_details.dart';
import 'package:movies_app/Presentation/layouts/movie_details/widgets/similer_builder.dart';

import '../../../core/reusable components/movie_card.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SelectedMovie movie =
        ModalRoute.of(context)?.settings.arguments as SelectedMovie;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(movie.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PosterDetails(movieId: movie.id),
              SizedBox(height: 10.h),
              SimilerBuilder(movie: movie),
              SizedBox(height: 20.h)
            ],
          ),
        ));
  }
}
