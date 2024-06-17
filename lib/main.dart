/// Excuela Challenge (Flutter) - Whady Martínez

import 'package:excuela_challenge/providers/progreso_provider.dart';
import 'package:excuela_challenge/screens/rootScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      /// Este widget de provider envuelvo la parte mas alta del arbol de widgets
      /// en un provider para dar acceso al estado de las variables que cada provider contiene.
      create: (_) {
        return ProgressProvider();
      },
      child: MaterialApp(
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
      ),
    );
  }
}
