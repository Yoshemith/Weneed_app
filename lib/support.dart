import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  Support({Key key}) : super(key: key);

  @override
  SupportState createState() => SupportState();
}

class SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Soporte"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(
              "Contactenos al correo:",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xffE8CA4D)),
            ),
            Text(""),
            Text("info@igniciongames.com")
          ])),
    );
  }
}
