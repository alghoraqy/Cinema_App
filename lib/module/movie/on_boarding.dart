import 'package:cinema_app/bloc/on_boarding_bloc/on_boarding_cubit.dart';
import 'package:cinema_app/bloc/on_boarding_bloc/on_bording_states.dart';
import 'package:cinema_app/module/movie/home_movie_screen.dart';
import 'package:cinema_app/shared/components/components.dart';
import 'package:cinema_app/shared/network/local/cach_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return OnBoardingCubit();
      },
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, states) {},
        builder: (context, states) {
          OnBoardingCubit cubit = OnBoardingCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.6,
                    child: PageView.builder(
                        itemCount: cubit.onBoardingList.length,
                        physics: const BouncingScrollPhysics(),
                        controller: cubit.pageController,
                        itemBuilder: (context, index) {
                          return OnBoardItem(
                              image: cubit.onBoardingList[index].image,
                              title: cubit.onBoardingList[index].title);
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SmoothPageIndicator(
                    controller: cubit.pageController,
                    count: cubit.onBoardingList.length,
                    axisDirection: Axis.horizontal,
                    effect: const SwapEffect(
                      dotHeight: 16,
                      dotWidth: 16,
                      type: SwapType.yRotation,
                      radius: 5,
                      spacing: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                      text: translate(context, key: 'GetStarted'),
                      onPressed: () {
                        CachHelper.saveData(key: 'onBoarding', value: true)
                            .then((value) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeMovieScreen();
                          }));
                        });
                      },
                      width: MediaQuery.of(context).size.width / 1.7,
                      margin: const EdgeInsets.only(bottom: 20))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
