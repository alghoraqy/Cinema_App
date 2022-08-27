import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/bloc/app_bloc/app_states.dart';
import 'package:cinema_app/module/series/series_screen.dart';
import 'package:cinema_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedSeriesScreen extends StatelessWidget {
  const TopRatedSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade600,
          appBar: myAppbar(context,
              text: 'Top Rated ',
              color: Colors.grey.shade600,
              textColor: Colors.white,
              backColor: Colors.white),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return MovieReview(
                      image: cubit.topRatedSeries!.results[index].image,
                      title: cubit.topRatedSeries!.results[index].name,
                      year: cubit.topRatedSeries!.results[index].year
                          .substring(0, 4),
                      rate: cubit.topRatedSeries!.results[index].rate,
                      discription:
                          cubit.topRatedSeries!.results[index].overview,
                      onPressed: () {
                        cubit.getActor(
                            id: cubit.topRatedSeries!.results[index].id);
                        cubit.getMovieDetail(
                            movieId: cubit.topRatedSeries!.results[index].id);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SeriesScreen(
                            image: cubit.topRatedSeries!.results[index].image,
                            id: cubit.topRatedSeries!.results[index].id,
                            title: cubit.topRatedSeries!.results[index].name,
                            overview:
                                cubit.topRatedSeries!.results[index].overview,
                            rate: cubit.topRatedSeries!.results[index].rate,
                          );
                        }));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                  itemCount: cubit.topRatedSeries!.results.length)),
        );
      },
    );
  }
}
