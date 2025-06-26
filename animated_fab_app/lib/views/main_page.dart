import 'dart:math';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  AnimationController? ac;
  Animation<double>? scaleAnimation;
  Animation<double>? rotateAnimation;
  bool trueFalse = false;

  @override
  void initState() {
    ac = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(ac!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();

    rotateAnimation = Tween(begin: 0.0, end: pi / 2).animate(ac!)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    ac!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final th = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Transform.scale(
            scale: scaleAnimation!.value,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
              backgroundColor: Colors.redAccent,
            ),
          ),
          Transform.scale(
            scale: scaleAnimation!.value,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.delete),
                backgroundColor: Colors.yellowAccent,
              ),
            ),
          ),

          Transform.rotate(
            angle: rotateAnimation!.value,
            child: FloatingActionButton(
              onPressed: () {
                if (trueFalse) {
                  ac!.reverse();
                  trueFalse = false;
                } else {
                  ac!.forward();
                  trueFalse = true;
                }
              },
              child: Icon(Icons.join_full),
              backgroundColor: Colors.cyanAccent,
            ),
          ),
        ],
      ),
    );
  }
}
