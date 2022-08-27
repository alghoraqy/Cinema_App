import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/bloc/app_bloc/app_states.dart';
import 'package:cinema_app/module/movie/movie_screen.dart';
import 'package:cinema_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade600,
          appBar: myAppbar(context,
              text: 'Top Rated',
              color: Colors.grey.shade600,
              textColor: Colors.white,
              backColor: Colors.white),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return MovieReview(
                      image: cubit.topRatedModel!.results[index].image,
                      title: cubit.topRatedModel!.results[index].title,
                      year: cubit.topRatedModel!.results[index].year
                          .substring(0, 4),
                      rate: cubit.topRatedModel!.results[index].rate,
                      discription: cubit.topRatedModel!.results[index].overview,
                      onPressed: () {
                        cubit.getActor(
                            id: cubit.topRatedModel!.results[index].id);
                        cubit.getMovieDetail(
                            movieId: cubit.topRatedModel!.results[index].id);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MovieScreen(
                            image: cubit.topRatedModel!.results[index].image,
                            id: cubit.topRatedModel!.results[index].id,
                            title: cubit.topRatedModel!.results[index].title,
                            overview:
                                cubit.topRatedModel!.results[index].overview,
                            rate: cubit.topRatedModel!.results[index].rate,
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
                  itemCount: cubit.topRatedModel!.results.length)),
        );
      },
    );
  }
}
