import 'dart:async';
import 'package:cinema_app/module/movie/home_movie_screen.dart';
import 'package:cinema_app/module/movie/on_boarding.dart';
import 'package:cinema_app/shared/constances/constances.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool textanimate = false;
  int? fontsized = 20;

  late final AnimationController _controller = AnimationController(
    value: 2,
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Widget? widget;
      if (onboard == true) {
        widget = const HomeMovieScreen();
      } else {
        if (onboard == null) {
          widget = const OnBoarding();
        }
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return widget!;
      }));
    });
    animate();
    super.initState();
  }

  void animate() {
    setState(() {
      Timer(const Duration(seconds: 1), () {
        setState(() {
          textanimate = true;
          fontsized = textanimate ? 30 : 18;
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _animation,
                child: ClipOval(
                    child: Image.asset(
                  'assets/images/movie.png',
                  fit: BoxFit.cover,
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedDefaultTextStyle(
                  style: TextStyle(
                    fontSize: fontsized!.toDouble(),
                    fontWeight: FontWeight.w700,
                  ),
                  curve: Curves.bounceOut,
                  duration: const Duration(seconds: 4),
                  child: const Text('Cinema App'))
            ],
          ),
        ),
      ),
    );
  }
}
