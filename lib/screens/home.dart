import 'package:excuela_challenge/screens/quiz.dart';
import 'package:excuela_challenge/widgets/tarjeta.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(                              /// AppBar con menu deslizable e icono de busqueda de cursos
          centerTitle: true,
          leading: const Icon(Icons.menu_rounded, color: Colors.white,),
          title: const Text('Inicio'),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search_rounded, color: Colors.white,),
            )
          ],
          shadowColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12.0, bottom: 8.0),
                child: Text('Lista de cursos', style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
              Tarjeta(                            /// Widget personalizado para tarjeta educativa
                imagen: 'https://civileats.com/wp-content/uploads/2021/09/210907-regenerative-dairy-alexandre-family-farm-scale-grazing-climate-soil-health-1-Watson_171026_1229_proof.jpg',
                titulo: 'Curso de Ganaderia Regenerativa',
                descripcion: 'Aprende a implementar prácticas de ganadería que regeneran el suelo, mejoran la biodiversidad y aumentan la productividad. Este curso te enseñará a integrar el ganado en el ecosistema de forma holística, promoviendo la salud del suelo, el bienestar animal y la rentabilidad de tu negocio.',),
            ],
          ),
        ),
      ),
    );
  }
}
