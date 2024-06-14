import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  String pregunta1 = '¿Cuál de las siguientes prácticas NO es característica de la ganadería regenerativa?';
  String opcionA = 'Pastoreo rotativo planificado para imitar los patrones de pastoreo natural.';
  String opcionB = 'Uso de herbicidas y pesticidas sintéticos para controlar malezas y plagas.';
  String opcionC = 'Integración de cultivos y ganado para mejorar la salud del suelo y la biodiversidad.';
  String opcionD = 'Monitoreo constante de la salud del suelo y ajuste de las prácticas según sea necesario.';

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
            children: [
              Pregunta1(
                width: width,
                pregunta1: pregunta1,
                opcionA: opcionA,
                opcionB: opcionB,
                opcionC: opcionC,
                opcionD: opcionD,)
            ],
          )
        )
    );
  }
}

class Pregunta1 extends StatefulWidget {
  Pregunta1({
    super.key,
    required this.pregunta1,
    required this.width,
    required this.opcionA,
    required this.opcionB,
    required this.opcionC,
    required this.opcionD,
  });

  final String pregunta1;
  final String opcionA;
  final String opcionB;
  final String opcionC;
  final String opcionD;
  final double width;

  @override
  State<Pregunta1> createState() => _Pregunta1State();
}

class _Pregunta1State extends State<Pregunta1> {

  bool? checkA = false;
  bool? checkB = false;
  bool? checkC = false;
  bool? checkD = false;

  bool? enabledA = true;
  bool? enabledB = true;
  bool? enabledC = true;
  bool? enabledD = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(widget.pregunta1,
            style: const TextStyle(fontSize: 25, color: Colors.white),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: widget.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckboxListTile(
                      title: Text(widget.opcionA, style: const TextStyle(fontSize: 18, color: Colors.white),),
                      activeColor: checkA == true ? Colors.red:Colors.grey,
                      checkColor: Colors.white,
                      value: checkA,
                      controlAffinity: ListTileControlAffinity.leading,
                      enabled: enabledA,
                      onChanged: (value){
                        setState(() {
                          checkA = value;

                          if (checkA == true) {
                            incorrecto(context);
                          }

                        });
                      }), /// Opcion A
                  CheckboxListTile(
                      title: Text(widget.opcionB, style: const TextStyle(fontSize: 18, color: Colors.white),),
                      activeColor: const Color.fromRGBO(
                          128, 255, 241, 0.5),
                      checkColor: Colors.white,
                      value: checkB,
                      controlAffinity: ListTileControlAffinity.leading,
                      enabled: enabledB,
                      onChanged: (value){
                        setState(() {
                          checkB = value;

                          if (checkB == true) {
                            correcto(context);
                          }

                        });
                      }), /// Opcion B
                  CheckboxListTile(
                      title: Text(widget.opcionC, style: const TextStyle(fontSize: 18, color: Colors.white),),
                      activeColor: checkC == true ? Colors.red:Colors.grey,
                      checkColor: Colors.white,
                      value: checkC,
                      controlAffinity: ListTileControlAffinity.leading,
                      enabled: enabledC,
                      onChanged: (value){
                        setState(() {
                          checkC = value;

                          if (checkC == true) {
                            incorrecto(context);
                          }

                        });
                      }), /// Opcion C
                  CheckboxListTile(
                      title: Text(widget.opcionD, style: const TextStyle(fontSize: 18, color: Colors.white),),
                      activeColor: checkD == true ? Colors.red:Colors.grey,
                      checkColor: Colors.white,
                      value: checkD,
                      controlAffinity: ListTileControlAffinity.leading,
                      enabled: enabledD,
                      onChanged: (value){
                        setState(() {
                          checkD = value;

                          if (checkD == true) {
                            incorrecto(context);
                          }

                        });
                      }), /// Opcion D
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

void correcto(context) {
  showDialog(context: context, builder: (context){
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      icon: const Icon(Icons.task_alt_rounded, size: 80, color: Color.fromRGBO(
          128, 255, 241, 0.5)),
      title: const Text('¡Bien Hecho!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
      content: const Text('La ganadería regenerativa busca minimizar o eliminar el uso de insumos químicos sintéticos, promoviendo en su lugar prácticas naturales para el control de plagas y malezas',
                        style: TextStyle(color: Colors.white, fontSize: 18),),
    );
  });
}

void incorrecto(context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(
      const SnackBar(
          duration: Duration(seconds: 2),
          content: Center(
            child: Text(
              'Incorrecto, intenta de nuevo',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight
                      .bold,
                  fontSize: 15),),
          ),
          backgroundColor: Colors.red));
}