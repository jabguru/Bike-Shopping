import 'package:flutter/material.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Expanded(child: SizedBox()),
          BottomNavBar(),
        ],
      ),
    );
  }
}
