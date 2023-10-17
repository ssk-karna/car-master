import 'package:connectus_dummy/views/home.dart';
import 'package:connectus_dummy/views/car_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars List',
      initialRoute: '/home', // Set the initial route
      routes: {
        '/home': (context) => Home(), // Define named routes
        '/carscreen': (context) => CarScreen(),
        '/carscreenmodified': (context) => CarScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

