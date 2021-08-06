import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weneed/page3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Page3': (context) => Page3(),
      },
      theme: ThemeData.dark(), //Tema de app, fondo en negro y letra en blanco
      title: 'Flutter Demo',
      home: MyHomePage(title: 'WeNeed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 120, bottom: 130.0),
              child: Image.asset(
                'assets/logo/Logo.png',
                fit: BoxFit.contain,
                height: 75,
              ),
            ),
            Text(
              'Inicia sesión con:',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: "calibri",
                fontWeight: FontWeight.w400,
                color: Color(0xffE8CA4D),
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //BOTON SIGN IN DE FACEBOOK
                IconButton(
                  icon: Image.asset('assets/logo/fb.png'),
                  iconSize: 45,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Page3');
                    print("Boton FB");
                  },
                ),
                Text("  "), //Espaciado ligero entre iconos xd
                //BOTON SIGN IN DE GMAIL
                IconButton(
                  icon: Image.asset('assets/logo/mail.png'),
                  iconSize: 50,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Page3');
                    print("Boton MAIL");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      //TEMRINOS Y CONDICIONES Y MARCA REGISTRADA
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: Text(
                  'Términos y condiciones',
                  style: TextStyle(
                    fontFamily: "calibri",
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    color: Color(0xffE8CA4D),
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: _launchURL,
              ),
              Text("©WeNeed 2020", style: TextStyle(color: Colors.white60)),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    print('Aqui te envia a los terminos y condiciones');
    const url = 'https://www.igniciongames.com/tyc';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo conectar a $url';
    }
  }
}
