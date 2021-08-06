import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weneed/page12.dart';

class Page7 extends StatefulWidget {
  Page7({Key key}) : super(key: key);

  @override
  _Page7State createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  String cliente = "Cliente";

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => Page12(
                        usuario: cliente,
                      )),
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
        //LOGO ON TOP SCREEN
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
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          "¡Genial! ahora espera",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "lanzamos un ",
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
                                      text: "en tu área",
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
                          "para encontrar el mejor talento. \n\n\n",
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
