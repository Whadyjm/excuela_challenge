import 'package:flutter/material.dart';

class Pregunta2 extends StatefulWidget {
  Pregunta2({
    super.key,
    required this.pregunta2,
    this.width,
    required this.pageController
  });

  final String pregunta2;
  PageController pageController= PageController();
  double? width;


  @override
  State<Pregunta2> createState() => _Pregunta2State();
}

class _Pregunta2State extends State<Pregunta2> {



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('¿Verdadero o Falso?',
          style: TextStyle(fontSize: 30, color: Colors.white),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: widget.width,
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(widget.pregunta2,
                style: const TextStyle(fontSize: 25, color: Colors.white),),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
                height: 60,
                minWidth: 150,
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                onPressed: (){
                  showDialog(context: context, builder: (context){
                    return Correcto(widget: widget);
                  });
                },
                child: const Text('Falso', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
            ),
            MaterialButton(
                height: 60,
                minWidth: 150,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                ),
                onPressed: (){
                  incorrecto(context);
                },
                child: const Text('Verdadero', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
            ),
          ],
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

  final Pregunta2 widget;

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
      content: const Text('La ganadería regenerativa prioriza la salud del suelo y la sostenibilidad a largo plazo, buscando un equilibrio entre la producción y la regeneración de los recursos naturales',
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