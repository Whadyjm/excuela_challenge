///
///
/// WIDGET TARJETA EDUCATIVA ///
///
///

import 'package:flutter/material.dart';

class Tarjeta extends StatefulWidget {
  Tarjeta({
    super.key,
    required this.imagen,
    required this.titulo,
    required this.descripcion});

  String imagen;
  String titulo;
  String descripcion;

  @override
  State<Tarjeta> createState() => _TarjetaState();
}

class _TarjetaState extends State<Tarjeta> {

  bool guardar = false;
  bool descarga = false;
  bool mostrar = false;

  @override
  Widget build(BuildContext context) {

    /// Por las especificaciones del challenge, decidí crear la tarjeta personalizada sin usar el Widget Card de Flutter
    /// La tarjeta ha sido creada a partir de un Container cuyos parámetros son personalizables

    double width = MediaQuery.of(context).size.width; /// Mide el ancho del widget padre en el cual se encuentra

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: width,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
                children: [
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network( /// ---> Imagen de la tarjeta
                      widget.imagen,
                    fit: BoxFit.cover,),
                  ),
                  Container(
                    height: 200,
                    width: width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.grey.shade900, Colors.transparent])
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton( /// Boton de descarga; al presionar muestra un SnackBar indicando que la descarga ha comenzado y cambia el icono a Pausa
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(128, 255, 241, 0.5),)
                          ),
                          onPressed: (){
                            setState(() {
                              descarga = !descarga;
                            });

                            try {
                              if (descarga == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                    const SnackBar(
                                        duration: Duration(seconds: 3),
                                        content: Center(
                                          child: Text(
                                            'Descargando curso',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight
                                                    .bold,
                                                fontSize: 15),),
                                        ),
                                        backgroundColor: Color.fromRGBO(
                                            128, 255, 241, 0.5)));
                              }
                            }
                            catch (e){

                            }

                          }, icon: descarga ? const Icon(Icons.stop_rounded):const Icon(Icons.download_rounded)),
                    ],
                  )
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.titulo, style: const TextStyle(color: Colors.white, fontSize: 18),),
            ),
            SizedBox(
              height: mostrar ? 180:75,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0, left: 12, right: 12),
                child: Flexible(child: Text(widget.descripcion, maxLines: mostrar ? 8:3, style: TextStyle(color: Colors.grey.shade400, fontSize: 15, overflow: TextOverflow.ellipsis),)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: GestureDetector(
                      onTap: (){
                        setState(() {
                          mostrar = !mostrar;
                        });
                      },
                      child: Text(mostrar ? 'Leer menos':'Leer más', style: TextStyle(color: Colors.grey.shade400, fontSize: 15))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: IconButton( /// Boton de Guardar, Al presionar mustra otro SnackBar el cual indica que el curso ya se ha guardado.
                    onPressed: (){
                      setState(() {
                        guardar = !guardar;
                      });

                      try {
                        if (guardar == true) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                              const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Center(
                                    child: Text(
                                      'Curso guardado',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight
                                              .bold,
                                          fontSize: 15),),
                                  ),
                                  backgroundColor: Color.fromRGBO(
                                      128, 255, 241, 0.5)));
                        }
                      }
                      catch (e){}
                    },
                    icon: Icon( guardar ? Icons.bookmark_rounded:Icons.bookmark_outline_rounded, size: 35,),
                    color: const Color.fromRGBO(128, 255, 241, 1),),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MaterialButton(
                    height: 45,
                    minWidth: 150,
                    color: const Color.fromRGBO(128, 255, 241, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                      onPressed: (){},
                    child: Row(
                      children: [
                        Text('Ir al curso', style: TextStyle(color: Colors.grey.shade900, fontSize: 18, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 10,),
                        const Icon(Icons.arrow_forward_rounded),
                      ],
                    )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
