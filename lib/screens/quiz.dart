import 'package:excuela_challenge/widgets/pregunta1.dart';
import 'package:excuela_challenge/widgets/pregunta2.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  String pregunta1 = '¿Cuál de las siguientes prácticas NO es característica de la ganadería regenerativa?';
  String pregunta2 = 'La ganadería regenerativa busca maximizar la producción de carne a corto plazo, incluso si esto implica degradar la salud del suelo a largo plazo';
  String opcionA = 'Pastoreo rotativo planificado para imitar los patrones de pastoreo natural.';
  String opcionB = 'Uso de herbicidas y pesticidas sintéticos para controlar malezas y plagas.';
  String opcionC = 'Integración de cultivos y ganado para mejorar la salud del suelo y la biodiversidad.';
  String opcionD = 'Monitoreo constante de la salud del suelo y ajuste de las prácticas según sea necesario.';
  final pageController = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(                              /// AppBar con menu deslizable e icono de busqueda de cursos
              centerTitle: true,
              leading: const Icon(Icons.menu_rounded, color: Colors.white,),
              title: const Flexible(child: Text('Ganaderia Regenerativa', style: TextStyle(overflow: TextOverflow.ellipsis),)),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search_rounded, color: Colors.white,),
                )
              ],
              shadowColor: Colors.black,
            ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Pregunta1(
                width: width,
                pregunta1: pregunta1,
                opcionA: opcionA,
                opcionB: opcionB,
                opcionC: opcionC,
                opcionD: opcionD, pageController: pageController,),
              Pregunta2(
                width: width,
                  pregunta2: pregunta2, pageController: pageController,)
            ],
          )
        )
    );
  }
}
