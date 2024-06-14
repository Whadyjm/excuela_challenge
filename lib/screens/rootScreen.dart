/// El RootScreen es el punto de partida de la navegación de la app.

import 'package:excuela_challenge/screens/home.dart';
import 'package:excuela_challenge/screens/quiz.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  late List<Widget> screens;
  int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    screens = const [
      Home(),
      Quiz()
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: Colors.grey,
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.grey.shade900,
        height: 70,
        selectedIndex: currentScreen,
        onDestinationSelected: (index){
          setState(() {
            currentScreen = index;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(selectedIcon: Icon(Icons.home, color: Colors.white), icon: Icon(Icons.home_outlined), label: 'Inicio',),
          NavigationDestination(selectedIcon: Icon(Icons.quiz_rounded, color: Colors.white,), icon: Icon(Icons.quiz_outlined), label: 'Quiz'),
          NavigationDestination(selectedIcon: Icon(Icons.area_chart_rounded, color: Colors.white,), icon: Icon(Icons.area_chart_outlined), label: 'Progreso'),
        ],
      ),
    );
  }
}
