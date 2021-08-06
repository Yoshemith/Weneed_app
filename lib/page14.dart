import 'dart:ui';
import 'package:flutter/material.dart';

class Page14 extends StatefulWidget {
  //Page14({Key key}) : super(key: key);

  //Valores requeridos en esta screen
  final String imageURL;
  final String oferta;
  final String nombre;
  final String servicio;

  //Page14({this.imageURL, this.oferta, this.nombre, this.servicio});
  //requerimientos obligatorios
  Page14(
      {Key key,
      @required this.imageURL,
      @required this.oferta,
      @required this.nombre,
      @required this.servicio})
      : super(key: key);

  @override
  _Page14State createState() =>
      _Page14State(imageURL, oferta, nombre, servicio);
}

class _Page14State extends State<Page14> {
  //Uso de parametros recibidos
  String imageURL;
  String oferta;
  String nombre;
  String servicio;

  _Page14State(this.imageURL, this.oferta, this.nombre, this.servicio);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false, //deshabilita el icono de regresar
        title: Image.asset('assets/logo/Logo.png',
            fit: BoxFit.contain, height: 45),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80.0, bottom: 30),
              child: Text(
                "¡Genial has escogido ya!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xffE8CA4D)),
              ),
            ),
            Padding(
              //Imagen del TECNICO
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Image.asset(imageURL, height: 120),
            ),
            Text(
              //TEXTO DE OFERTA
              oferta,
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xffe8ca4d),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              //TEXTO DE NOMBRE
              nombre,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Text(
              //TEXTO DE SERVICIO
              servicio,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: RaisedButton.icon(
                color: Colors.black,
                icon: Image.asset('assets/logo/llamar.png', height: 20),
                onPressed: () {
                  print("Click en boton llamar");
                },
                label: Text(
                  "Llamar",
                  style: TextStyle(fontSize: 22, color: Color(0xffe8ca4d)),
                ),
              ),
            ),
            Image.asset('assets/logo/SadFace.png', height: 35),
            Text(
              "\nNo me gusto, ver más ofertas",
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: RaisedButton.icon(
                    color: Color(0xffe8ca4d),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      //REGRESA A LA PANTALLA ANTERIOR (3 OFERTAS)
                      Navigator.of(context).pop();
                      print("Boton aqui");
                    },
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.black,
                      size: 18,
                    ),
                    label: Text(
                      " Aquí ",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
