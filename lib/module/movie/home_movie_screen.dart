import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/bloc/app_bloc/app_states.dart';
import 'package:cinema_app/localizations/app_localizations.dart';
import 'package:cinema_app/module/movie/movie_screen.dart';
import 'package:cinema_app/module/movie/populer_movie_screen.dart';
import 'package:cinema_app/module/movie/top_rated_movie_screen.dart';
import 'package:cinema_app/module/series/series_home_screen.dart';
import 'package:cinema_app/module/splash/splash_screen.dart';
import 'package:cinema_app/shared/components/components.dart';
import 'package:cinema_app/shared/constances/constances.dart';
import 'package:cinema_app/shared/network/local/cach_helper.dart';
import 'package:cinema_app/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMovieScreen extends StatelessWidget {
  const HomeMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, states) {
        AppCubit cubit = AppCubit.get(context);
        return DefaultTabController(
            length: 2,
            initialIndex: 0,
            animationDuration: const Duration(milliseconds: 800),
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: FloatingActionButton(
                  backgroundColor: AppColors.basecolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  onPressed: () {
                    CachHelper.removeData(key: 'onBoarding').then((value) {
                      onboard = null;
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const SplashScreen();
                      }));
                    });
                  },
                  child: const Icon(
                    Icons.keyboard_double_arrow_left_sharp,
                    size: 40,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: cubit.connectionState
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 50,
                          right: 15,
                          left: 15),
                      child: Column(
                        children: [
                          SafeArea(
                            bottom: false,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.5,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: AppColors.basecolor)),
                                        child: TabBar(
                                          tabs: [
                                            TabItem(
                                              label: translate(context,
                                                  key: 'movies'),
                                              color: cubit.ontab
                                                  ? Colors.grey.shade300
                                                  : Colors.white,
                                              icon: Icons
                                                  .slow_motion_video_outlined,
                                            ),
                                            TabItem(
                                              label: translate(context,
                                                  key: 'series'),
                                              color: cubit.ontab
                                                  ? Colors.white
                                                  : Colors.grey.shade300,
                                              icon: Icons.local_movies_outlined,
                                            )
                                          ],
                                          indicatorColor: Colors.black,
                                          indicatorSize:
                                              TabBarIndicatorSize.label,
                                          enableFeedback: false,
                                          onTap: (index) {
                                            cubit.changetab(index);
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          50,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.basecolor)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                            icon: Icon(
                                                Icons.arrow_drop_down_rounded),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            alignment: Alignment.centerRight,
                                            items: ['ar', 'en'].map((e) {
                                              return DropdownMenuItem<String>(
                                                  value: e, child: Text(e));
                                            }).toList(),
                                            value: 'ar',
                                            onChanged: (value) {}),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.27,
                                  child: (cubit.nowPlayingModel != null) &
                                          (cubit.topRatedModel != null) &
                                          (cubit.populerModel != null)
                                      ? TabBarView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                              SingleChildScrollView(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                child: Column(
                                                  children: [
                                                    cubit.nowPlayingModel !=
                                                            null
                                                        ? CarouselSlider(
                                                            items: cubit
                                                                .nowPlayingModel!
                                                                .results
                                                                .map((e) {
                                                              return NowPlaying(
                                                                moviename:
                                                                    e.title,
                                                                image: e.poster,
                                                                rate: e.rate,
                                                                onPressed: () {
                                                                  cubit.getActor(
                                                                      id: e.id);
                                                                  cubit.getMovieDetail(
                                                                      movieId:
                                                                          e.id);
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder:
                                                                              (context) {
                                                                    return MovieScreen(
                                                                      image: e
                                                                          .image,
                                                                      id: e.id,
                                                                      title: e
                                                                          .title,
                                                                      overview:
                                                                          e.overview,
                                                                      rate: e
                                                                          .rate,
                                                                    );
                                                                  }));
                                                                },
                                                              );
                                                            }).toList(),
                                                            options: CarouselOptions(
                                                                autoPlayInterval:
                                                                    const Duration(
                                                                        seconds:
                                                                            6),
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    3,
                                                                autoPlay: true,
                                                                autoPlayCurve:
                                                                    Curves
                                                                        .bounceOut,
                                                                enlargeCenterPage:
                                                                    true,
                                                                disableCenter:
                                                                    false,
                                                                viewportFraction:
                                                                    1),
                                                          )
                                                        : Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: AppColors
                                                                  .basecolor,
                                                            ),
                                                          ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    TopRatedRow(
                                                      text: translate(context,
                                                          key: 'Top_Rated'),
                                                      seemoreOnPressed: () {
                                                        navigateTo(context,
                                                            screen:
                                                                const TopRatedScreen());
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              5,
                                                      child:
                                                          cubit.topRatedModel !=
                                                                  null
                                                              ? ListView
                                                                  .separated(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return MovieItem(
                                                                      image: cubit
                                                                          .topRatedModel!
                                                                          .results[
                                                                              index]
                                                                          .image,
                                                                      onPressed:
                                                                          () {
                                                                        cubit.getActor(
                                                                            id: cubit.topRatedModel!.results[index].id);
                                                                        cubit.getMovieDetail(
                                                                            movieId:
                                                                                cubit.topRatedModel!.results[index].id);
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder:
                                                                                (context) {
                                                                          return MovieScreen(
                                                                            image:
                                                                                cubit.topRatedModel!.results[index].image,
                                                                            id: cubit.topRatedModel!.results[index].id,
                                                                            title:
                                                                                cubit.topRatedModel!.results[index].title,
                                                                            overview:
                                                                                cubit.topRatedModel!.results[index].overview,
                                                                            rate:
                                                                                cubit.topRatedModel!.results[index].rate,
                                                                          );
                                                                        }));
                                                                      },
                                                                      rate: cubit
                                                                          .topRatedModel!
                                                                          .results[
                                                                              index]
                                                                          .rate,
                                                                    );
                                                                  },
                                                                  separatorBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return const SizedBox(
                                                                      width: 8,
                                                                    );
                                                                  },
                                                                  itemCount: cubit
                                                                          .topRatedModel!
                                                                          .results
                                                                          .length -
                                                                      5,
                                                                )
                                                              : Center(
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: AppColors
                                                                        .basecolor,
                                                                  ),
                                                                ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    TopRatedRow(
                                                      text: translate(context,
                                                          key: 'populer'),
                                                      seemoreOnPressed: () {
                                                        navigateTo(context,
                                                            screen:
                                                                const PopulerScreen());
                                                      },
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              5,
                                                      child:
                                                          cubit.populerModel !=
                                                                  null
                                                              ? ListView
                                                                  .separated(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemBuilder:
                                                                      (ctx,
                                                                          index) {
                                                                    return MovieItem(
                                                                      image: cubit
                                                                          .populerModel!
                                                                          .results[
                                                                              index]
                                                                          .image,
                                                                      onPressed:
                                                                          () {
                                                                        cubit.getActor(
                                                                            id: cubit.populerModel!.results[index].id);
                                                                        cubit.getMovieDetail(
                                                                            movieId:
                                                                                cubit.populerModel!.results[index].id);
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder:
                                                                                (context) {
                                                                          return MovieScreen(
                                                                            image:
                                                                                cubit.populerModel!.results[index].image,
                                                                            id: cubit.populerModel!.results[index].id,
                                                                            title:
                                                                                cubit.populerModel!.results[index].title,
                                                                            overview:
                                                                                cubit.populerModel!.results[index].overview,
                                                                            rate:
                                                                                cubit.populerModel!.results[index].rate,
                                                                          );
                                                                        }));
                                                                      },
                                                                      rate: cubit
                                                                          .populerModel!
                                                                          .results[
                                                                              index]
                                                                          .rate,
                                                                    );
                                                                  },
                                                                  separatorBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return const SizedBox(
                                                                      width: 8,
                                                                    );
                                                                  },
                                                                  itemCount: cubit
                                                                          .populerModel!
                                                                          .results
                                                                          .length -
                                                                      5,
                                                                )
                                                              : Center(
                                                                  child: CircularProgressIndicator(
                                                                      color: AppColors
                                                                          .basecolor),
                                                                ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const HomeSeriesScreen(),
                                            ])
                                      : Center(
                                          child: CircularProgressIndicator(
                                              color: AppColors.basecolor),
                                        ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            translate(context, key: 'noInternet'),
                            style: Theme.of(context).textTheme.headline1,
                          )
                        ],
                      ),
                    ),
            ));
      },
    );
  }
}
