import 'package:cinema_app/bloc/on_boarding_bloc/on_bording_states.dart';
import 'package:cinema_app/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitState());

  static OnBoardingCubit get(context) {
    return BlocProvider.of(context);
  }

  List<OnBoarding> onBoardingList = [
    OnBoarding('assets/images/first.jpeg', 'Watch Newest Movies'),
    OnBoarding('assets/images/allmovies.jpeg', 'All New Movies are available'),
    OnBoarding(
        'assets/images/series.jpeg', 'Watch All Newest Serie and Episods'),
  ];

  var pageController = PageController();
}
