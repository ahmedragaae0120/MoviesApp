import 'package:flutter/material.dart';
import 'package:movies_app/core/Utils/app_colors.dart';

class TextsStyles{
  static const TextStyle appBarTitle = TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400,fontFamily: "Poppins");
  static const TextStyle filledButton = TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600,fontFamily: "Inter");
  static const TextStyle selectedLabelInBottomNavigationBar = TextStyle(color: AppColors.primaryColor,fontSize: 8,fontWeight: FontWeight.w400,fontFamily: "Inter");
  static const TextStyle unselectedLabelInBottomNavigationBar = TextStyle(color: AppColors.unselectedNavigatorBarIconColor,fontSize: 8,fontWeight: FontWeight.w400,fontFamily: "Inter");
  static const TextStyle loginRegisterWhiteTitle = TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400,fontFamily: "Inter");
  static const TextStyle loginRegisterPrimeTitle = TextStyle(color: AppColors.primaryColor,fontSize: 30,fontWeight: FontWeight.w700,fontFamily: "Inter");
  static const TextStyle mainMovieName = TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400,fontFamily: "Inter");
  static const TextStyle movieDescription = TextStyle(color: AppColors.movieCategoryInBorderTitleAndMovieDescriptionColor,fontSize: 13,fontWeight: FontWeight.w400,fontFamily: "Inter");
  static const TextStyle movieMiniDetails = TextStyle(color: AppColors.detailsForMovieColor,fontSize: 10,fontWeight: FontWeight.w400,fontFamily: "Inter");
  static const TextStyle movieRating = TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w400,fontFamily: "Poppins");
  static TextStyle movieDetailsInSearchAndWatchListColor = TextStyle(color: AppColors.movieDetailsInSearchAndWatchListColor,fontSize: 13,fontWeight: FontWeight.w400,fontFamily: "Inter");
  static const TextStyle category = TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600,fontFamily: "Poppins");

}