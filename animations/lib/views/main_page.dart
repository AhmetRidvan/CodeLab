import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            Text(
              'Weather',
              style: TextStyle(fontSize: 36, color: th.onSurface),
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: th.onSurface),
                onPressed: () {},
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
