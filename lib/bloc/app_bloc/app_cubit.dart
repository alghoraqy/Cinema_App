import 'package:cinema_app/bloc/app_bloc/app_states.dart';
import 'package:cinema_app/models/get_actor_model.dart';
import 'package:cinema_app/models/movie_datails_model.dart';
import 'package:cinema_app/models/now_playing_model.dart';
import 'package:cinema_app/models/on_the_air_model.dart';
import 'package:cinema_app/models/populer_model.dart';
import 'package:cinema_app/models/top_rated_model.dart';
import 'package:cinema_app/shared/constances/end_points.dart';
import 'package:cinema_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  bool ontab = true;

  void changetab(int index) {
    if (index == 0) {
      ontab = true;
      emit(ChangeTabState());
    } else {
      if (index == 1) {
        ontab = false;
        emit(ChangeTabState());
      }
    }
  }

  NowPlayingModel? nowPlayingModel;
  void getNowPlaying() {
    DioHelper.getData(
      path: EndPoints.nowPlaying,
    ).then((value) {
      nowPlayingModel = NowPlayingModel.fromJson(value.data);
      emit(GetNowPlayingSuccess());
    }).catchError((error) {
      emit(GetNowPlayingError(error.toString()));
    });
  }

  TopRatedModel? topRatedModel;
  void getTopRated() {
    DioHelper.getData(path: EndPoints.topRated).then((value) {
      topRatedModel = TopRatedModel.fromJson(value.data);
      emit(GetTopRatedSuccess());
    }).catchError((error) {
      emit(GetTopRatedError(error.toString()));
    });
  }

  PopulerModel? populerModel;
  void getPopuler() {
    DioHelper.getData(path: EndPoints.populer).then((value) {
      populerModel = PopulerModel.fromJson(value.data);
      emit(GetPopulerSuccess());
    }).catchError((error) {
      emit(GetPopulerError(error.toString()));
    });
  }

  MovieDetailsModel? movieDetailsModel;
  Future<void> getMovieDetail({required int movieId}) {
    return DioHelper.getData(path: EndPoints.movieDetails(movieId))
        .then((value) {
      movieDetailsModel = MovieDetailsModel.fromJson(value.data);
      emit(GetMovieDetailsSuccess());
    }).catchError((error) {
      emit(GetMovieDetailsError(error.toString()));
    });
  }

  GetActorModel? getActorModel;
  void getActor({required int id}) {
    DioHelper.getData(path: EndPoints.getActor(id)).then((value) {
      getActorModel = GetActorModel.fromJson(value.data);
      emit(GetActorSuccess());
    }).catchError((error) {
      emit(GetActorError(error.toString()));
    });
  }

  //////////////////////////////////////// Series

  GetOnTheAirModel? onTheAirModel;
  void getOnTheAirSeries() {
    DioHelper.getData(path: EndPoints.onTheAir).then((value) {
      onTheAirModel = GetOnTheAirModel.fromJson(value.data);
      emit(GetOnTheAirSuccess());
    }).catchError((error) {
      emit(GetOnTheAirError(error.toString()));
    });
  }

  GetOnTheAirModel? topRatedSeries;
  void getTopRatedSeries() {
    DioHelper.getData(path: EndPoints.topRatedSeries).then((value) {
      topRatedSeries = GetOnTheAirModel.fromJson(value.data);
      emit(GetTopRatedSuccess());
    }).catchError((error) {
      emit(GetTopRatedError(error.toString()));
    });
  }

  GetOnTheAirModel? populerSeries;
  void getPopulerSeries() {
    DioHelper.getData(path: EndPoints.populerSeries).then((value) {
      populerSeries = GetOnTheAirModel.fromJson(value.data);
      emit(GetPopulerSeiresSuccess());
    }).catchError((error) {
      emit(GetPopulerError(error.toString()));
    });
  }
}
