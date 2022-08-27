import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/bloc/app_bloc/app_states.dart';
import 'package:cinema_app/module/movie/movie_screen.dart';
import 'package:cinema_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopulerScreen extends StatelessWidget {
  const PopulerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (contex, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade600,
          appBar: myAppbar(context,
              text: 'Populer Movies',
              color: Colors.grey.shade600,
              textColor: Colors.white,
              backColor: Colors.white),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return MovieReview(
                    image: cubit.populerModel!.results[index].image,
                    title: cubit.populerModel!.results[index].title,
                    year:
                        cubit.populerModel!.results[index].year.substring(0, 4),
                    rate: cubit.populerModel!.results[index].rate,
                    discription: cubit.populerModel!.results[index].overview,
                    onPressed: () {
                      cubit.getActor(id: cubit.populerModel!.results[index].id);
                      cubit.getMovieDetail(
                          movieId: cubit.populerModel!.results[index].id);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MovieScreen(
                          image: cubit.populerModel!.results[index].image,
                          id: cubit.populerModel!.results[index].id,
                          title: cubit.populerModel!.results[index].title,
                          overview: cubit.populerModel!.results[index].overview,
                          rate: cubit.populerModel!.results[index].rate,
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
