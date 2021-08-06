import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weneed/page11.dart';

class Page10 extends StatefulWidget {
  Page10({Key key}) : super(key: key);

  @override
  _Page10State createState() => _Page10State();
}

class _Page10State extends State<Page10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //LOGO ON TOP SCREEN
        title: Image.asset(
          'assets/logo/Logo.png',
          fit: BoxFit.contain,
          height: 45,
        ),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 1.0),
                        child: Image.asset(
                          'assets/logo/Tecnico.png',
                          fit: BoxFit.contain,
                          height: 115,
                        ),
                      ),
                      Text(
                        "\nAutorizas el envio de",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "notificaciones ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                                text: "PUSH ",
                                style: TextStyle(
                                  color: Color(0xffe8ca4d),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text: "cuando",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                      Text(
                        "un usuario solicite servicios",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "asociados a tu oficio.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //BOTON CONTINUAR
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 100),
                child: Directionality(
                  textDirection:
                      TextDirection.rtl, //Indica lado del texto(left)
                  child: RaisedButton.icon(
                      color: Color(0xffe8ca4d),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25), //boton largo
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        //CLICK Y AVANZA AL PAGE11
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Page11()),
                        );
                        print("Boton Si, lo quiero ->");
                      },
                      icon:
                          Icon(Icons.arrow_back, color: Colors.black, size: 18),
                      label: Text("Sí, lo quiero",
                          style: TextStyle(fontSize: 15, color: Colors.black))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
