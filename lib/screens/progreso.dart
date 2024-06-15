import 'package:excuela_challenge/providers/progreso_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {

    final puntos = Provider.of<ProgressProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(                              /// AppBar con menu deslizable e icono de busqueda de cursos
        centerTitle: true,
        leading: const Icon(Icons.menu_rounded, color: Colors.white,),
        title: const Flexible(child: Text('Tu Progreso', style: TextStyle(overflow: TextOverflow.ellipsis),)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search_rounded, color: Colors.white,),
          )
        ],
        shadowColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Puntaje: ${(puntos.puntos*100).toStringAsFixed(0)}%', style: TextStyle(color: Colors.white, fontSize: 25),),
            const SizedBox(height: 80,),
            SizedBox(
              height: 200,
              width: 200,
              child: Consumer<ProgressProvider>(
                builder: (BuildContext context, ProgressProvider value, Widget? child) {
                  return CircularProgressIndicator(
                    value: puntos.puntos,
                    color: const Color.fromRGBO(128, 255, 241, 1),
                    strokeWidth: 50,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
