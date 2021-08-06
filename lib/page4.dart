import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:weneed/page5.dart';

class Page4 extends StatefulWidget {
  Page4({Key key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => Page5()),
            ));
    //Espera 2 SEGUNDOS y entra otro SCREEN
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
          automaticallyImplyLeading: false,
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
                            'assets/logo/Cliente.png',
                            fit: BoxFit.contain,
                            height: 115,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          "¡FELICIDADES!",
                          style: TextStyle(
                            color: Color(0xffE8CA4D),
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "Ahora podras solicitar\n           servicios. \n\n\n",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
