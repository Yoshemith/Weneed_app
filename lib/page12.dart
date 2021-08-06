import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weneed/page13.dart';

class Page12 extends StatefulWidget {
  //Page12({Key key}) : super(key: key);

  //Variables requeridas en esta screen
  final String usuario;

  //requerimientos obligatorios
  Page12({Key key, @required this.usuario}) : super(key: key);

  @override
  _Page12State createState() => _Page12State(usuario);
}

class _Page12State extends State<Page12> {
  String usuario;
  _Page12State(this.usuario);

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => Page13(usuario: usuario)),
            ));
    //Espera 3 SEGUNDOS y entra a otro SCREEN
  }

  @override
  Widget build(BuildContext context) {
    //willPopScope inhabilita el back del boton de android (Del telefono)
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "READY! \n",
                style: TextStyle(
                    color: Color(0xffe8ca4d),
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
