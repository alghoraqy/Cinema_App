import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/bloc/app_bloc/app_states.dart';
import 'package:cinema_app/shared/components/components.dart';
import 'package:cinema_app/shared/constances/constances.dart';
import 'package:cinema_app/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieScreen extends StatelessWidget {
  final String image;
  final int id;
  final String title;
  final dynamic rate;
  final String overview;
  const MovieScreen({
    Key? key,
    required this.image,
    required this.id,
    required this.title,
    required this.rate,
    required this.overview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade800,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2.1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image(
                            image:
                                NetworkImage('${AppConstances.imageUrl}$image'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            cubit.movieDetailsModel = null;
                            Navigator.pop(context);
                          },
                          mini: true,
                          backgroundColor: Colors.black.withOpacity(.2),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        cubit.movieDetailsModel != null
                            ? PositionedDirectional(
                                bottom: 8,
                                end: 10,
                                child: Text(
                                  ' ${cubit.movieDetailsModel!.runtime} m',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    cubit.movieDetailsModel != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  movieDetails(context,
                                      width: 75,
                                      text: cubit.movieDetailsModel!.genre),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.black.withOpacity(.4)),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow.shade700,
                                            size: 23,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            '$rate',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  overview,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Actor",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 6.5,
                                child: cubit.getActorModel != null
                                    ? ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return ActorItem(
                                            image: cubit.getActorModel!
                                                .cast[index].image,
                                            onPressed: () {},
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const SizedBox(
                                            width: 8,
                                          );
                                        },
                                        itemCount: 15)
                                    : const SizedBox(),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.basecolor,
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
