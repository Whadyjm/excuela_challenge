/// El RootScreen es el punto de partida de la navegación de la app.
/// Desde se accede a cada Widget solicitado (Tarjeta Educativa, Quiz y Progreso).

import 'package:excuela_challenge/screens/home.dart';
import 'package:excuela_challenge/screens/progreso.dart';
import 'package:excuela_challenge/screens/quiz.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {

  late List<Widget> screens;  /// Declara una lista para asignar cada Widget
  int currentScreen = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    screens = const [
      Home(),
      Quiz(),
      Progress(),
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        /// El Widget PageView permite desplegar cada pantalla en un solo widget padre para así
        /// crear mas fluidez en la navegación entre pantallas desde una navegación principal.
        physics: const NeverScrollableScrollPhysics(), /// ---> Evita el scroll dentro del PageView
        controller: controller, /// ---> Permite controlar el acceso a cada pantalla del PageView
        children: screens,
      ),
      bottomNavigationBar: NavigationBar( /// Despliega la barra de Navegación principal
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
