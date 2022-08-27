import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/module/splash/splash_screen.dart';
import 'package:cinema_app/shared/constances/constances.dart';
import 'package:cinema_app/shared/network/local/cach_helper.dart';
import 'package:cinema_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  DioHelper.init();
  onboard = CachHelper.getData(key: 'onBoarding');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()
              ..getNowPlaying()
              ..getTopRated()
              ..getPopuler()
              ..getOnTheAirSeries()
              ..getTopRatedSeries()
              ..getPopulerSeries()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Poppins',
            textTheme: const TextTheme(
                headline1: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                headline2: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                button: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
