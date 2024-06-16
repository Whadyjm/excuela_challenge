///
///
/// WIDGET PROGRESO CIRCULAR ///
///
///

import 'package:excuela_challenge/providers/progreso_provider.dart';
import 'package:excuela_challenge/screens/quiz.dart';
import 'package:excuela_challenge/screens/rootScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {

    /// Esta variable permite acceder al estado de la variable manejada por el provider
    final puntos = Provider.of<ProgressProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(  /// AppBar con menu deslizable e icono de busqueda de cursos
        centerTitle: true,
        title: const Flexible(child: Text('Tu Progreso', style: TextStyle(overflow: TextOverflow.ellipsis),)),
        shadowColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            puntos.puntos == 1.0
                ? const Column(
                  children: [
                    Text('¡Felicidades!', style: TextStyle(color: Colors.white, fontSize: 50),),
                    Text('Has completado el quiz con éxito', style: TextStyle(color: Colors.white, fontSize: 20),),
                  ],
                )
                : const SizedBox.shrink(),
            Container(
              padding: const EdgeInsets.only(right: 8, left: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(21),
                ),
                /// En este texto se muestra el valor del puntaje, se recibe un valor entre 0 y 1 decimal, se multiplica por 100 y se eliminan los decimales
                /// gracias al metodo .toStringAsFixed()
                child: Text('${(puntos.puntos*100).toStringAsFixed(0)}%', style: const TextStyle(color: Color.fromRGBO(128, 255, 241, 1), fontSize: 50),)),
            const SizedBox(height: 20,),
            SizedBox(
              height: 200,
              width: 200,
              child: Consumer<ProgressProvider>(
                builder: (BuildContext context, ProgressProvider value, Widget? child) {
                  return CircularProgressIndicator(
                    value: puntos.puntos, /// Este valor varía entre 0 y 1, es un valor decimal
                    backgroundColor: Colors.grey.shade700,
                    color: const Color.fromRGBO(128, 255, 241, 1),
                    strokeWidth: 50,
                  );
                },
              ),
            ),
            const SizedBox(height: 60,),

            puntos.puntos == 0
                ? const SizedBox.shrink()
                : MaterialButton(
                height: 60,
                minWidth: 250,
                color: const Color.fromRGBO(128, 255, 241, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                onPressed: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){
                    return const RootScreen();
                  }), (route) => false);
                  setState(() {});
                  /// Método del provider que se encarga de reiniciar el puntaje
                  puntos.reinicioPuntos();
                },
                child: Text('Reiniciar progreso', style: TextStyle(color: Colors.grey.shade900, fontSize: 18, fontWeight: FontWeight.bold),)
            ),
          ],
        ),
      ),
    );
  }
}
