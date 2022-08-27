import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/bloc/app_bloc/app_states.dart';
import 'package:cinema_app/module/series/series_screen.dart';
import 'package:cinema_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopulerSeriesScreen extends StatelessWidget {
  const PopulerSeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (contex, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade600,
          appBar: myAppbar(context,
              text: 'Populer Series',
              color: Colors.grey.shade600,
              textColor: Colors.white,
              backColor: Colors.white),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return MovieReview(
                    image: cubit.populerSeries!.results[index].image,
                    title: cubit.populerSeries!.results[index].name,
                    year: cubit.populerSeries!.results[index].year
                        .substring(0, 4),
                    rate: cubit.populerSeries!.results[index].rate,
                    discription: cubit.populerSeries!.results[index].overview,
                    onPressed: () {
                      cubit.getActor(
                          id: cubit.populerSeries!.results[index].id);
                      cubit.getMovieDetail(
                          movieId: cubit.populerSeries!.results[index].id);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SeriesScreen(
                          image: cubit.populerSeries!.results[index].image,
                          id: cubit.populerSeries!.results[index].id,
                          title: cubit.populerSeries!.results[index].name,
                          overview:
                              cubit.populerSeries!.results[index].overview,
                          rate: cubit.populerSeries!.results[index].rate,
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
                itemCount: cubit.populerModel!.results.length),
          ),
        );
      },
    );
  }
}
