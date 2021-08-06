import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weneed/history.dart';
import 'package:weneed/page14.dart';
import 'package:weneed/page5.dart';
import 'package:weneed/page8.dart';
import 'package:weneed/support.dart';

class Page13 extends StatefulWidget {
  //Page13({Key key}) : super(key: key);
  //Variables requeridas en esta screen
  final String usuario;

  //requerimientos obligatorios
  Page13({Key key, @required this.usuario}) : super(key: key);
  @override
  _Page13State createState() => _Page13State(usuario);
}

class _Page13State extends State<Page13> {
  String usuario;
  _Page13State(this.usuario);
  //parametros a pasar a la SCREEN 14
  String imageURL;

  //INDICADORES DE HABILITADO/DESHABILITADO EN LOS BOTONES
  bool isEnabled = true;
  bool isEnabled2 = true;
  bool isEnabled3 = true;
  String nombre;
  String oferta;
  String servicio;

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
          //automaticallyImplyLeading: false, //deshabilita el icono de regresar
          title: Image.asset('assets/logo/Logo.png',
              fit: BoxFit.contain, height: 45),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                //Condicion que cambia imagen dependiendo si es cliente o no
                child: Image.asset(
                  (usuario.contains('Cliente'))
                      ? 'assets/logo/Cliente.png'
                      : 'assets/logo/Tecnico.png',
                  fit: BoxFit.fill,
                  height: 10,
                ),
              ),
              //En el gesture detector, al tocar el icono Cliente/Tecnico
              //Te regresara a las pantallas ¿Que necesitas? / Unos ajustes mas
              onTap: () {
                (usuario.contains('Cliente'))
                    ? Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => Page5()))
                    : Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => Page8()));
              },
            ),
          ],
        ),
        //MENU DEL USUARIO (SWITCH-HISTORY-SOPORTE-LOGOUT)
        drawer: Theme(
          //color del tema del listview (Switch, history, support)
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.black.withOpacity(0.90)),
          child: new Drawer(
            child: ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  //decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)), //color de la parte user
                  accountName: Text("Username",
                      style: TextStyle(color: Color(0xffE8CA4D))),
                  accountEmail: Text("User@email.com"),
                  currentAccountPicture: new CircleAvatar(
                    //Aqui va la imagen del usuario
                    child: new Image.asset('assets/logo/Cliente.png'),
                    //backgroundImage: new NetworkImage('http:link de la imagen')
                  ),
                ),
                //BOTON SWITCH
                new ListTile(
                  leading: Icon(Icons.swap_horiz, color: Color(0xffE8CA4D)),
                  title: Text("Switch"),
                  //Condicion que cambia el switch dependiendo si es cliente o no
                  onTap: () {
                    (usuario.contains('Cliente'))
                        ? Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) => Page8()))
                        : Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) => Page5()));
                  },
                ),
                Divider(
                  color: Colors.white24,
                  height: 0.1,
                ),
                //BOTON HISTORIAL
                new ListTile(
                  leading: Icon(Icons.history, color: Color(0xffE8CA4D)),
                  title: Text("Historial"),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => History()));
                    print("Boton Historial");
                  },
                ),
                Divider(
                  color: Colors.white24,
                  height: 0.1,
                ),
                //BOTON SOPORTE
                new ListTile(
                  leading: Icon(Icons.support, color: Color(0xffE8CA4D)),
                  title: Text("Soporte"),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) => Support()));
                    print("Boton Soporte");
                  },
                ),
                Divider(
                  color: Colors.white24,
                  height: 0.1,
                ),
                //NEW LOGOUT BUTTON AGREGADO ***********************************
                //BOTON LOGOUT
                new ListTile(
                  leading: Icon(Icons.logout, color: Color(0xffE8CA4D)),
                  title: Text("Log Out"),
                  onTap: () {
                    print("Boton Log Out");
                  },
                ),
                Divider(
                  color: Colors.white24,
                  height: 0.1,
                ),
              ],
            ),
          ),
        ),
        //CONTENIDO DEL SCREEN
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //OFERTA 1
            Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 60),
              child: RaisedButton.icon(
                color: Colors.black,
                onPressed: isEnabled
                    ? () {
                        //LISTA DE PARAMETROS CON LOS VALORES A ENVIAR
                        imageURL = 'assets/logo/Tecnico.png';
                        oferta = 'OFERTA 1';
                        nombre = 'Juan Perez 1';
                        servicio = 'Mecanico 1';
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Page14(
                                    //ASIGNACION DE VALORES CON LOS REQUERIDOS EN SCREEN14
                                    imageURL: imageURL,
                                    oferta: oferta,
                                    nombre: nombre,
                                    servicio: servicio,
                                  )),
                        );
                        setState(() {
                          //VARIABLE A FALSO (DESHABILITA)
                          isEnabled = false;
                        });
                        print("Boton OFERTA 1");
                      }
                    : () {
                        print("Deshabilitado 1"); //no hace nada al clickear
                      },
                //A continuacion en el icono, cambia de color basado
                //En la condicion de la variable isEnabled(false/true)
                icon: Image.asset(
                  'assets/logo/Tecnico.png',
                  color: !isEnabled ? Colors.white24 : null,
                  height: 100,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "OFERTA 1",
                        style: TextStyle(
                            fontSize: 24,
                            //cambia de color basado
                            //En la condicion de la variable isEnabled(false/true)
                            color: isEnabled
                                ? Color(0xffe8ca4d) // isEnabled = true
                                : Color(0xffe8ca4d).withOpacity(0.3), //false
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Juan Perez 1",
                        style: TextStyle(
                            // isEnabled = false then (white24) else null
                            color: !isEnabled ? Colors.white24 : null,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Mecanico 1 ",
                        style: TextStyle(
                            // isEnabled = false then (white24) else null
                            color: !isEnabled ? Colors.white24 : null,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //OFERTA 2
            Padding(
              padding: const EdgeInsets.only(left: 50, bottom: 60),
              child: RaisedButton.icon(
                color: Colors.black,
                onPressed: isEnabled2
                    ? () {
                        //LISTA DE PARAMETROS CON LOS VALORES A ENVIAR
                        imageURL = 'assets/logo/Tecnico.png';
                        oferta = 'OFERTA 2';
                        nombre = 'Juan Perez 2';
                        servicio = 'Mecanico 2';
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Page14(
                                    //ASIGNACION DE VALORES CON LOS REQUERIDOS EN SCREEN14
                                    imageURL: imageURL,
                                    oferta: oferta,
                                    nombre: nombre,
                                    servicio: servicio,
                                  )),
                        );
                        setState(() {
                          //VARIABLE A FALSO (DESHABILITA)
                          isEnabled2 = false;
                        });
                        print("Boton OFERTA 2");
                      }
                    : () {
                        print("Deshabilitado 2"); //no hace nada al clickear
                      },
                //A continuacion en el icono, cambia de color basado
                //En la condicion de la variable isEnabled(false/true)
                icon: Image.asset(
                  'assets/logo/Tecnico.png',
                  color: !isEnabled2 ? Colors.white24 : null,
                  height: 100,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "OFERTA 2",
                        style: TextStyle(
                            fontSize: 24,
                            //cambia de color basado
                            //En la condicion de la variable isEnabled(false/true)
                            color: isEnabled2
                                ? Color(0xffe8ca4d) //isEnabled = true
                                : Color(0xffe8ca4d).withOpacity(0.3), //false
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Juan Perez 2",
                        style: TextStyle(
                            // isEnabled = false then (white24) else null
                            color: !isEnabled2 ? Colors.white24 : null,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Mecanico 2 ",
                        style: TextStyle(
                            // isEnabled = false then (white24) else null
                            color: !isEnabled2 ? Colors.white24 : null,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //OFERTA 3
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: RaisedButton.icon(
                color: Colors.black,
                onPressed: isEnabled3
                    ? () {
                        //LISTA DE PARAMETROS CON LOS VALORES A ENVIAR
                        imageURL = 'assets/logo/Tecnico.png';
                        oferta = 'OFERTA 3';
                        nombre = 'Juan Perez 3';
                        servicio = 'Mecanico 3';
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Page14(
                                    //ASIGNACION DE VALORES CON LOS REQUERIDOS EN SCREEN14
                                    imageURL: imageURL,
                                    oferta: oferta,
                                    nombre: nombre,
                                    servicio: servicio,
                                  )),
                        );
                        setState(() {
                          //VARIABLE A FALSO (DESHABILITA)
                          isEnabled3 = false;
                        });
                        print("Boton OFERTA 3");
                      }
                    : () {
                        print("Deshabilitado 3"); //no hace nada al clickear
                      },
                //A continuacion en el icono, cambia de color basado
                //En la condicion de la variable isEnabled(false/true)
                icon: Image.asset(
                  'assets/logo/Tecnico.png',
                  color: !isEnabled3 ? Colors.white24 : null,
                  height: 100,
                ),
                label: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "OFERTA 3",
                        style: TextStyle(
                            fontSize: 24,
                            //cambia de color basado
                            //En la condicion de la variable isEnabled(false/true)
                            color: isEnabled3
                                ? Color(0xffe8ca4d) //isEnabled = true
                                : Color(0xffe8ca4d).withOpacity(0.3), //false
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Juan Perez 3",
                        style: TextStyle(
                            // isEnabled = false then (white24) else null
                            color: !isEnabled3 ? Colors.white24 : null,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Mecanico 3 ",
                        style: TextStyle(
                            // isEnabled = false then (white24) else null
                            color: !isEnabled3 ? Colors.white24 : null,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
