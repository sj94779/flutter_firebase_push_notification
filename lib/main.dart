import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_push_notification/api/firebase_api.dart';
import 'package:firebase_push_notification/pages/home_screen.dart';
import 'package:firebase_push_notification/pages/notification_screen.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        NotificationScreen.route: (context) => const NotificationScreen(),
      },
    );
  }
}

