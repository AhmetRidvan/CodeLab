import 'dart:math';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? alpha;
  Animation<double>? scale;
  Animation<double>? rotate;
  Animation<double>? translate;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    alpha = Tween(begin: 0.0, end: 1.0).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();

    scale = Tween(begin: 50.0, end: 100.0).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });

    rotate = Tween(begin: 0.0, end: 2 * pi).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });

    translate =
        Tween(begin: -0.0, end: 100.0).animate(
          CurvedAnimation(
            parent: animationController!,
            curve: Curves.easeInOut,
          ),
        )..addListener(() {
          setState(() {});
        });
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: th.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'images/vecteezy_3d-weather-icon-day-with-rain_24825193.png',
              width: 300,
            ),
            Transform.translate(
              offset: Offset(0.0, translate!.value),
              child: Text(
                'Weather',
                style: TextStyle(fontSize: scale!.value, color: th.onSurface),
              ),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: th.onSurface),
                onPressed: () {
                  animationController!.repeat(count: 19, reverse: true);
                },
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 36, color: th.surface),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
