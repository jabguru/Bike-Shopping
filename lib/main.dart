import 'package:bike_shopping/screens/home.dart';
import 'package:bike_shopping/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bike Shopping',
        theme: AppTheme.themeData,
        home: const HomeScreen(),
      ),
    );
  }
}
