import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var flp = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    final androidSetup = AndroidInitializationSettings(
      '@mipmap/ic_launcher.png',
    );
    final iosSetup = DarwinInitializationSettings();

    final setup = InitializationSettings(android: androidSetup, iOS: iosSetup);
    await flp.initialize(
      setup,
      onDidReceiveNotificationResponse: (details) {
        //when clicked on notification
        var payLoad = details.payload;
        if (payLoad != null) {
          print('Touched the noti $payLoad');
        }
      },
    );
  }

  @override
  void initState() {
    setup();
    super.initState();
  }

  Future<void> showNotification() async {
    final android = AndroidNotificationDetails(
      'android_id',
      'android',
    ); //for group
    final ios = DarwinNotificationDetails();

    final combination = NotificationDetails(android: android, iOS: ios);

    flp.show(0, 'Title', 'Hi', combination, payload: 'xxx');
  }

  Future<void> delayedShowNotification() async {
    final android = AndroidNotificationDetails(
      'android_id',
      'android',
    ); //for group
    final ios = DarwinNotificationDetails();

    final combination = NotificationDetails(android: android, iOS: ios);
    tz.initializeTimeZones();

    final delay = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));

    flp.zonedSchedule(
      0,
      'Hi',
      'Body',
      delay,
      combination,
      androidScheduleMode: AndroidScheduleMode.alarmClock,payload: 'Delayed content'
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification usage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                showNotification();
              },
              child: Text('Create notification'),
            ),
            ElevatedButton(
              onPressed: () {
                delayedShowNotification();
              },
              child: Text('Create notification delayed'),
            ),
          ],
        ),
      ),
    );
  }
}
