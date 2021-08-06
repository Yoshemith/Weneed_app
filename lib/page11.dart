import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weneed/page12.dart';

class Page11 extends StatefulWidget {
  Page11({Key key}) : super(key: key);

  @override
  _Page11State createState() => _Page11State();
}

class _Page11State extends State<Page11> {
  String tecnico = "Tecnico";

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Esperemos que pronto llegue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "una solicitud de tu servicio",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "a un potencial cliente. \n\n",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            //BOTON CONTINUAR
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Directionality(
                textDirection: TextDirection.rtl, //Indica lado del texto(left)
                child: RaisedButton.icon(
                    color: Color(0xffe8ca4d),
                    padding: EdgeInsets.symmetric(horizontal: 25), //boton largo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                      //CLICK Y AVANZA A PAGE12
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => Page12(
                                  usuario: tecnico,
                                )),
                      );
                      print("Boton Continuar ->");
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black, size: 18),
                    label: Text("Continuar",
                        style: TextStyle(fontSize: 15, color: Colors.black))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
