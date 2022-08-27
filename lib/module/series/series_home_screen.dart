import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/bloc/app_bloc/app_states.dart';

import 'package:cinema_app/module/series/populer_series_screen.dart';
import 'package:cinema_app/module/series/series_screen.dart';
import 'package:cinema_app/module/series/top_rated_series_screen.dart';
import 'package:cinema_app/shared/components/components.dart';
import 'package:cinema_app/shared/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSeriesScreen extends StatelessWidget {
  const HomeSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              cubit.onTheAirModel != null
                  ? CarouselSlider(
                      items: cubit.onTheAirModel!.results.map((e) {
                        return NowPlaying(
                          moviename: e.name,
                          image: e.poster ?? e.image,
                          rate: e.rate,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SeriesScreen(
                                image: e.image,
                                id: e.id,
                                title: e.name,
                                overview: e.overview,
                                rate: e.rate,
                              );
                            }));
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                          autoPlayInterval: const Duration(seconds: 6),
                          height: MediaQuery.of(context).size.height / 3,
                          autoPlay: true,
                          autoPlayCurve: Curves.bounceOut,
                          enlargeCenterPage: true,
                          disableCenter: false,
                          viewportFraction: 1),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: AppColors.basecolor,
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              TopRatedRow(
                text: 'Top Rated',
                seemoreOnPressed: () {
                  navigateTo(context, screen: const TopRatedSeriesScreen());
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: cubit.topRatedSeries != null
                    ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return MovieItem(
                            image: cubit.topRatedSeries!.results[index].image,
                            onPressed: () {
                              cubit.getActor(
                                  id: cubit.topRatedSeries!.results[index].id);
                              cubit.getMovieDetail(
                                  movieId:
                                      cubit.topRatedSeries!.results[index].id);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SeriesScreen(
                                  image: cubit
                                      .topRatedSeries!.results[index].image,
                                  id: cubit.topRatedSeries!.results[index].id,
                                  title:
                                      cubit.topRatedSeries!.results[index].name,
                                  overview: cubit
                                      .topRatedSeries!.results[index].overview,
                                  rate:
                                      cubit.topRatedSeries!.results[index].rate,
                                );
                              }));
                            },
                            rate: cubit.topRatedSeries!.results[index].rate,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                        itemCount: cubit.topRatedSeries!.results.length - 5,
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: AppColors.basecolor,
                        ),
                      ),
              ),
              const SizedBox(
                height: 5,
              ),
              TopRatedRow(
                text: 'Popular',
                seemoreOnPressed: () {
                  navigateTo(context, screen: const PopulerSeriesScreen());
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: cubit.populerSeries != null
                    ? ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return MovieItem(
                            image: cubit.populerSeries!.results[index].image,
                            onPressed: () {
                              cubit.getActor(
                                  id: cubit.populerSeries!.results[index].id);
                              cubit.getMovieDetail(
                                  movieId:
                                      cubit.populerSeries!.results[index].id);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SeriesScreen(
                                  image:
                                      cubit.populerSeries!.results[index].image,
                                  id: cubit.populerSeries!.results[index].id,
                                  title:
                                      cubit.populerSeries!.results[index].name,
                                  overview: cubit
                                      .populerSeries!.results[index].overview,
                                  rate:
                                      cubit.populerSeries!.results[index].rate,
                                );
                              }));
                            },
                            rate: cubit.populerSeries!.results[index].rate,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                        itemCount: cubit.populerSeries!.results.length - 5,
                      )
                    : Center(
                        child: CircularProgressIndicator(
                            color: AppColors.basecolor),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
