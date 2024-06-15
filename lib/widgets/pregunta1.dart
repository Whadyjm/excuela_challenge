import 'package:flutter/material.dart';

class Pregunta1 extends StatefulWidget {
  Pregunta1({
    super.key,
    required this.pregunta1,
    required this.width,
    required this.opcionA,
    required this.opcionB,
    required this.opcionC,
    required this.opcionD,
    required this.pageController
  });

  final String pregunta1;
  final String opcionA;
  final String opcionB;
  final String opcionC;
  final String opcionD;
  final double width;
  PageController pageController= PageController();

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
                      checkColor: Colors.red,
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
                            showDialog(context: context, builder: (context){
                              return Correcto(widget: widget);
                            });
                          }

                        });
                      }), /// Opcion B
                  CheckboxListTile(
                      title: Text(widget.opcionC, style: const TextStyle(fontSize: 18, color: Colors.white),),
                      activeColor: checkC == true ? Colors.red:Colors.grey,
                      checkColor: Colors.red,
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
                      checkColor: Colors.red,
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

class Correcto extends StatelessWidget {
  const Correcto({
    super.key,
    required this.widget,
  });

  final Pregunta1 widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      icon: const Icon(Icons.task_alt_rounded, size: 80, color: Color.fromRGBO(
          128, 255, 241, 0.5)),
      title: const Text('¡Bien Hecho!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
      actions: [
        SizedBox(
          width: 145,
          child: MaterialButton(
              height: 45,
              color: const Color.fromRGBO(128, 255, 241, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ),
              onPressed: (){
                widget.pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.ease);
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Text('Siguiente', style: TextStyle(color: Colors.grey.shade900, fontSize: 18, fontWeight: FontWeight.bold),),
                  const SizedBox(width: 10,),
                  const Icon(Icons.arrow_forward_rounded),
                ],
              )
          ),
        ),
      ],
      content: const Text('La ganadería regenerativa busca minimizar o eliminar el uso de insumos químicos sintéticos, promoviendo en su lugar prácticas naturales para el control de plagas y malezas',
        style: TextStyle(color: Colors.white, fontSize: 18),),
    );
  }
}

void incorrecto(context) {
  ScaffoldMessenger.of(context)
      .showSnackBar(
      const SnackBar(
          duration: Duration(seconds: 1),
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