import 'package:excuela_challenge/widgets/multiple.dart';
import 'package:excuela_challenge/widgets/verdaderoFalso.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  String pregunta1 = '¿Cuál de las siguientes prácticas NO es característica de la ganadería regenerativa?';
  String pregunta2 = 'La ganadería regenerativa busca maximizar la producción de carne a corto plazo, incluso si esto implica degradar la salud del suelo a largo plazo';
  String pregunta3 = '¿Cuál de las siguientes prácticas es un principio fundamental de la ganadería regenerativa?';

  String opcionA1 = 'Pastoreo rotativo planificado para imitar los patrones de pastoreo natural.';
  String opcionB1 = 'Uso de herbicidas y pesticidas sintéticos para controlar malezas y plagas.';
  String opcionC1 = 'Integración de cultivos y ganado para mejorar la salud del suelo y la biodiversidad.';
  String opcionD1 = 'Monitoreo constante de la salud del suelo y ajuste de las prácticas según sea necesario.';

  String opcionA2 = 'Uso intensivo de fertilizantes químicos para aumentar la productividad del suelo.';
  String opcionB2 = 'Pastoreo continuo en un mismo potrero para maximizar el aprovechamiento del forraje.';
  String opcionC2 = 'Monitoreo constante de la salud del suelo y ajuste de las prácticas de manejo según sea necesario.';
  String opcionD2 = 'Confinamiento del ganado en espacios reducidos para facilitar el control y la alimentación.';

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
              Multiple(
                width: width,
                pregunta1: pregunta1,
                opcionA: opcionA1,
                opcionB: opcionB1,
                opcionC: opcionC1,
                opcionD: opcionD1,
                pageController: pageController,
                explicacion: 'La ganadería regenerativa busca minimizar o eliminar el uso de insumos químicos sintéticos, promoviendo en su lugar prácticas naturales para el control de plagas y malezas.',),
              VerdaderoFalso(
                width: width,
                pregunta2: pregunta2,
                pageController: pageController,),
              Multiple(
                width: width,
                pregunta1: pregunta3,
                opcionA: opcionA2,
                opcionB: opcionB2,
                opcionC: opcionC2,
                opcionD: opcionD2,
                pageController: pageController,
                explicacion: 'La ganadería regenerativa se basa en la observación y adaptación constante a las condiciones del ecosistema, ajustando las prácticas de manejo para promover la salud del suelo y la biodiversidad.',),
            ],
          )
        )
    );
  }
}
