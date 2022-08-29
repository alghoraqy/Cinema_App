import 'package:cinema_app/bloc/app_bloc/app_cubit.dart';
import 'package:cinema_app/bloc/app_bloc/app_states.dart';
import 'package:cinema_app/localizations/app_localizations.dart';
import 'package:cinema_app/module/splash/splash_screen.dart';
import 'package:cinema_app/shared/constances/constances.dart';
import 'package:cinema_app/shared/network/local/cach_helper.dart';
import 'package:cinema_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        BlocProvider(create: (context) => AppCubit()..checkInternet()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is CheckInternetSuccess) {
            AppCubit.get(context).getNowPlaying();
            AppCubit.get(context).getTopRated();
            AppCubit.get(context).getPopuler();
            AppCubit.get(context).getOnTheAirSeries();
            AppCubit.get(context).getTopRatedSeries();
            AppCubit.get(context).getPopulerSeries();
          }
        },
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                fontFamily: 'poppins',
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
            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (devicelocal, supportedLocales) {
              for (var locale in supportedLocales) {
                if (devicelocal != null &&
                    devicelocal.languageCode == locale.languageCode) {
                  return devicelocal;
                }
              }
              return supportedLocales.first;
            },
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child!);
            },
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
