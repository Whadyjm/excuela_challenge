import 'package:excuela_challenge/screens/home.dart';
import 'package:excuela_challenge/screens/rootScreen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Excuela',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(    /// Establece colores y tamaños de elementos que se encuentran dentro del AppBar
            backgroundColor: Colors.black38,
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,),
            iconTheme: IconThemeData(size: 25)
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
        useMaterial3: true,
      ),
      home: const RootScreen(),
    );
  }
}
