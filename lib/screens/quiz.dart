///
///
/// WIDGET QUIZ ///
///
///

import 'package:excuela_challenge/widgets/multiple.dart';
import 'package:excuela_challenge/widgets/verdaderoFalso.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  /// Set de preguntas usadas en el Quiz
  ///
  String pregunta1 = '¿Cuál de las siguientes prácticas NO es característica de la ganadería regenerativa?';
  String pregunta2 = 'La ganadería regenerativa busca maximizar la producción de carne a corto plazo, incluso si esto implica degradar la salud del suelo a largo plazo';
  String pregunta3 = '¿Cuál de las siguientes prácticas es un principio fundamental de la ganadería regenerativa?';

  /// Set de opciones usados en cada pregunta de selección múltiple
  ///
  String opcionA1 = 'Pastoreo rotativo planificado para imitar los patrones de pastoreo natural.';
  String opcionB1 = 'Uso de herbicidas y pesticidas sintéticos para controlar malezas y plagas.';
  String opcionC1 = 'Integración de cultivos y ganado para mejorar la salud del suelo y la biodiversidad.';
  String opcionD1 = 'Monitoreo constante de la salud del suelo y ajuste de las prácticas según sea necesario.';
  ///
  String opcionA2 = 'Uso intensivo de fertilizantes químicos para aumentar la productividad del suelo.';
  String opcionB2 = 'Pastoreo continuo en un mismo potrero para maximizar el aprovechamiento del forraje.';
  String opcionC2 = 'Monitoreo constante de la salud del suelo y ajuste de las prácticas de manejo según sea necesario.';
  String opcionD2 = 'Confinamiento del ganado en espacios reducidos para facilitar el control y la alimentación.';
  ///

  final pageController = PageController(
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width; /// Mide el ancho del widget padre en el cual se encuentra

    return SafeArea(  /// Despeja la zona de las barras de notificaciones en el teléfono.
        child: Scaffold(
            appBar: AppBar(                              /// AppBar con menu deslizable e icono de busqueda de cursos
              centerTitle: true,
              title: const Flexible(child: Text('Ganaderia Regenerativa', style: TextStyle(overflow: TextOverflow.ellipsis),)),
              shadowColor: Colors.black,
            ),
          body: PageView(
            /// El Widget PageView fue utilizado de nuevo para el diseño del Quiz, basandome en la ventaja que anteriormente mencioné.
            /// Una Navegación mas fluida dentro de un Widget padre.
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Multiple(
                /// Pregunta 1: Pregunta de opción múltiple
                /// Todos los parámetros aca mostrados son personalizables.
                width: width,
                pregunta1: pregunta1,
                opcionA: opcionA1,
                opcionB: opcionB1,
                opcionC: opcionC1,
                opcionD: opcionD1,
                pageController: pageController,
                explicacion: 'La ganadería regenerativa busca minimizar o eliminar el uso de insumos químicos sintéticos, promoviendo en su lugar prácticas naturales para el control de plagas y malezas.',),
              VerdaderoFalso(
                /// Pregunta 2: Pregunta de verdadero o false
                /// Todos los parámetros aca mostrados son personalizables.
                width: width,
                pregunta2: pregunta2,
                pageController: pageController,),
              Multiple(
                /// Pregunta 3: Pregunta de opción múltiple
                /// Todos los parámetros aca mostrados son personalizables.
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
