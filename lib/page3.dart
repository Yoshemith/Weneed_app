import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weneed/page4.dart';
import 'package:weneed/page8.dart';

class Page3 extends StatefulWidget {
  Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    //willPopScope inhabilita el back del boton de android (Del telefono)
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        //LOGO ON TOP SCREEN Y OPCION MENU
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Image.asset('assets/logo/Logo.png',
              fit: BoxFit.contain, height: 45),
          centerTitle: true,
        ),
        //BOTON MENU
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 120, bottom: 50),
              child: Text(
                "¿Que quieres ser?",
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: "calibri",
                  fontWeight: FontWeight.w400,
                  color: Color(0xffE8CA4D),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //BOTON CLIENTE
                    IconButton(
                      color: Colors.white,
                      padding: EdgeInsets.only(right: 45, bottom: 15),
                      icon: Image.asset('assets/logo/Cliente.png'),
                      iconSize: 100.0,
                      onPressed: () {
                        //Navegacion a la Page (Felicidades)
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Page4()),
                        );
                        print("Boton CLIENTE");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: Text(
                        "CLIENTE\n",
                        style: TextStyle(
                          color: Color(0xffE8CA4D),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: Text(
                        "Quien solicita \n   el servicio",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                //BOTON TECNICO/PROFESIONAL
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.only(left: 45, bottom: 15),
                      icon: Image.asset('assets/logo/Tecnico.png'),
                      iconSize: 100.0,
                      onPressed: () {
                        //Navegacion a la Page (Felicidades)
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Page8()),
                        );
                        print("Boton TÉCNICO / PROFESIONAL");
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(
                        "   TÉCNICO / \nPROFESIONAL",
                        style: TextStyle(
                          color: Color(0xffE8CA4D),
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: Text(
                        "Quien realiza \n    la oferta",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
